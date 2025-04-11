targetScope = 'subscription'
// The main bicep module to provision Azure resources.
// For a more complete walkthrough to understand how this file works with azd,
// see https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/make-azd-compatible?pivots=azd-create

@minLength(1)
@maxLength(64)
@description('Name of the the environment which is used to generate a short unique hash used in all resources.')
param environmentName string

@minLength(1)
@description('Primary location for all resources')
param location string
param containers array

param containerAppName string
// If no resourceGroupName is provided, create one using abbreviations.
var dynamicResourceGroupName = !empty(resourceGroupName) ? resourceGroupName : '${abbrs.resourcesResourceGroups}${environmentName}'

// Dynamically build the managed environment resource ID.
var dynamicEnvironmentId = '/subscriptions/${subscription().subscriptionId}/resourceGroups/${dynamicResourceGroupName}/providers/Microsoft.App/managedEnvironments/${environmentName}'

@secure()
param secrets object = {
  arrayValue: []
}
param registries array
param ingress object
param workspaceName string
param workspaceLocation string

// Optional parameters to override the default azd resource naming conventions.
// Add the following to main.parameters.json to provide values:
// "resourceGroupName": {
//      "value": "myGroupName"
// }
param resourceGroupName string = ''

var abbrs = loadJsonContent('./abbreviations.json')

// tags that should be applied to all resources.
var tags = {
  // Tag all resources with the environment name.
  'azd-env-name': environmentName
}

// Generate a unique token to be used in naming resources.
// Remove linter suppression after using.
#disable-next-line no-unused-vars
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))

// Name of the service defined in azure.yaml
// A tag named azd-service-name with this value should be applied to the service host resource, such as:
//   Microsoft.Web/sites for appservice, function
// Example usage:
//   tags: union(tags, { 'azd-service-name': apiServiceName })
#disable-next-line no-unused-vars
var apiServiceName = 'python-api'

// Create resource group at the subscription scope.
resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: dynamicResourceGroupName
  location: location
  tags: tags
}

// Deploy Log Analytics Workspace
module logAnalyticsWorkspace './modules/log-analytics-workspace.bicep' = {
  name: 'log-analytics-workspace'
  scope: rg
  params: {
    workspaceName: workspaceName
    location: location
    containerAppName: containerAppName
    environmentId: dynamicEnvironmentId
    environmentName: environmentName
    workspaceLocation: location
  }
}

// Deploy Container Apps
module containerApps './modules/containers.bicep' = {
  name: 'container-apps'
  scope: rg
  params: {
    containerAppName: containerAppName
    location: location
    environmentId: dynamicEnvironmentId
    containers: containers
    secrets: secrets
    registries: registries
    ingress: ingress
    workspaceName: workspaceName
    environmentName: environmentName
  }
  dependsOn: [
    logAnalyticsWorkspace
  ]
}

// Add outputs from the deployment here, if needed.
//
// This allows the outputs to be referenced by other bicep deployments in the deployment pipeline,
// or by the local machine as a way to reference created resources in Azure for local development.
// Secrets should not be added here.
//
// Outputs are automatically saved in the local azd environment .env file.
// To see these outputs, run `azd env get-values`,  or `azd env get-values --output json` for json output.
output AZURE_LOCATION string = location
output AZURE_TENANT_ID string = tenant().tenantId
