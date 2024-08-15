@secure()
param adminPassword string
param adminUsername string
param location string
param name string
param networkInterfaceId string
param vmSize string

resource ubuntuVM 'Microsoft.Compute/virtualMachines@2020-12-01' = {
  name: '${name}-vm'
  location: location
  properties: {
    hardwareProfile: {
      vmSize: vmSize
    }
    osProfile: {
      computerName: 'computerName'
      adminUsername: adminUsername
      adminPassword: adminPassword
    }
    storageProfile: {
      imageReference: {
        publisher: 'Canonical'
        offer: 'UbuntuServer'
        sku: '16.04-LTS'
        version: 'latest'
      }
      osDisk: {
        name: '${name}-disk'
        caching: 'ReadWrite'
        createOption: 'FromImage'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: networkInterfaceId
        }
      ]
    }
  }
}
