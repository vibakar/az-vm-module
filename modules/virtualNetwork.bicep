param name string
param location string
param addressPrefixes array
param subnets array

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: '${name}-vpc'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: addressPrefixes
    }
    subnets: [for (cidr, index) in subnets: {
        name: 'subnet-${index}'
        properties: {
          addressPrefix: cidr
        }
      }]
  }
}

resource networkInterface 'Microsoft.Network/networkInterfaces@2020-11-01' = {
  name: '${name}-ni'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: virtualNetwork.properties.subnets[0].id
          }
        }
      }
    ]
  }
}

output networkInterfaceId string = networkInterface.id
output virtualNetworkId string = virtualNetwork.id
