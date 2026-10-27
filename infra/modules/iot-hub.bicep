targetScope = 'resourceGroup'

@description('IoT Hub name.')
@minLength(3)
@maxLength(50)
param name string

@description('Azure region.')
param location string

@description('SKU: F1 (free), S1 (standard).')
param skuName string = 'F1'

@description('Resource tags.')
param tags object

resource iotHub 'Microsoft.Devices/IotHubs@2023-06-30' = {
  name: name
  location: location
  tags: tags
  sku: {
    name: skuName
    capacity: 1
  }
  properties: {
    eventHubEndpoints: {
      events: {
        retentionTimeInDays: 1
        partitionCount: 2
      }
    }
    routing: {
      fallbackRoute: {
        name: '$fallback'
        source: 'DeviceMessages'
        condition: 'true'
        endpointNames: ['events']
        isEnabled: true
      }
    }
    cloudToDevice: {
      maxDeliveryCount: 10
      defaultTtlAsIso8601: 'PT1H'
    }
  }
}

output iotHubId string = iotHub.id
output hostName string = iotHub.properties.hostName
