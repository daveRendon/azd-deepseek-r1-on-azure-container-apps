using 'main.bicep'

param containerAppName = 'deepseekr1'

param location = 'westus3'

param containers = [
  {
    name: 'deepseekr1'
    image: 'ghcr.io/open-webui/open-webui:ollama'
    command: []
    args: []
    resources: {
      cpu: 8
      memory: '56Gi'
    }
  }
]

param registries = []

param secrets = {
  arrayValue: []
}

param ingress = {
  external: true
  transport: 'Auto'
  allowInsecure: false
  targetPort: 8080
  stickySessions: {
    affinity: 'none'
  }
  additionalPortMappings: []
}

param environmentName = 'managedEnvironment-azinsiderdemo-deepseekr1'
param workspaceName = 'workspaceazinsiderdemo8707'
param workspaceLocation = 'westus3'
