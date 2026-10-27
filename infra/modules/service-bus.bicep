targetScope = 'resourceGroup'

@description('Service Bus namespace name.')
@minLength(6)
@maxLength(50)
param name string

@description('Azure region.')
param location string

@description('Resource tags.')
param tags object

resource namespace 'Microsoft.ServiceBus/namespaces@2022-10-01-preview' = {
  name: name
  location: location
  tags: tags
  sku: {
    name: 'Basic'
    tier: 'Basic'
  }
}

resource queueAlertas 'Microsoft.ServiceBus/namespaces/queues@2022-10-01-preview' = {
  parent: namespace
  name: 'alertas-calidad'
  properties: {
    maxDeliveryCount: 5
    defaultMessageTimeToLive: 'P1D'
    lockDuration: 'PT30S'
  }
}

resource queueComandos 'Microsoft.ServiceBus/namespaces/queues@2022-10-01-preview' = {
  parent: namespace
  name: 'comandos-dispositivo'
  properties: {
    maxDeliveryCount: 3
    defaultMessageTimeToLive: 'PT1H'
    lockDuration: 'PT30S'
  }
}

output namespaceId string = namespace.id
output namespaceName string = namespace.name
