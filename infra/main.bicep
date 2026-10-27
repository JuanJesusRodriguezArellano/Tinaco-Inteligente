targetScope = 'resourceGroup'

@description('Base name for all resources.')
@minLength(3)
@maxLength(20)
param projectName string = 'tinacointeli'

@description('Azure region.')
param location string = resourceGroup().location

@description('Environment tag.')
@allowed(['dev', 'staging', 'prod'])
param environment string = 'dev'

@description('IoT Hub SKU.')
param iotHubSku string = 'F1'

@description('App Service plan SKU.')
param appServiceSku string = environment == 'prod' ? 'B1' : 'F1'

@description('Custom Vision training endpoint (provided after manual portal creation).')
param customVisionEndpoint string = ''

@description('Custom Vision prediction key (use Key Vault in prod).')
@secure()
param customVisionKey string = ''

var tags = {
  environment: environment
  project: 'tinaco-inteligente'
  team: 'ISC09C-UPA'
  managedBy: 'bicep'
}

module iotHub 'modules/iot-hub.bicep' = {
  name: 'deploy-iot-hub'
  params: {
    name: 'iot-${projectName}-${environment}'
    location: location
    skuName: iotHubSku
    tags: tags
  }
}

module storage 'modules/storage-account.bicep' = {
  name: 'deploy-storage'
  params: {
    name: 'st${projectName}${environment}'
    location: location
    tags: tags
  }
}

module serviceBus 'modules/service-bus.bicep' = {
  name: 'deploy-service-bus'
  params: {
    name: 'sb-${projectName}-${environment}'
    location: location
    tags: tags
  }
}

module appService 'modules/app-service.bicep' = {
  name: 'deploy-app-service'
  params: {
    name: 'app-${projectName}-${environment}'
    location: location
    skuName: appServiceSku
    tags: tags
  }
}

module functionApp 'modules/function-app.bicep' = {
  name: 'deploy-function-app'
  params: {
    name: 'func-${projectName}-${environment}'
    location: location
    storageAccountName: storage.outputs.storageAccountName
    tags: tags
  }
}

output iotHubHostName string = iotHub.outputs.hostName
output storageAccountName string = storage.outputs.storageAccountName
output serviceBusNamespace string = serviceBus.outputs.namespaceName
output appServiceUrl string = appService.outputs.defaultHostName
output functionAppUrl string = functionApp.outputs.defaultHostName
