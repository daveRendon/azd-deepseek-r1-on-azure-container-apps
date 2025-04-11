
param containerAppName string
param location string
param environmentId string

@secure()
param secrets object = {
  arrayValue: []
}
param environmentName string
param workspaceName string
param workspaceLocation string

resource workspace 'Microsoft.OperationalInsights/workspaces@2020-08-01' = {
  name: workspaceName
  location: workspaceLocation
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 30
    workspaceCapping: {}
  }
  dependsOn: []
}
