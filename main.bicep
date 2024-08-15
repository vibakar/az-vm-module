targetScope = 'resourceGroup'

param addressPrefixes array
@secure()
param adminPassword string
param adminUsername string
param location string
param name string
param vmSize string
param subnets array

module virtualNetwork 'modules/virtualNetwork.bicep' = {
  name: 'vn'
  params: {
    addressPrefixes: addressPrefixes
    location: location
    name: name
    subnets: subnets
  }
}

module virtualMachine 'modules/virtualMachine.bicep' = {
  name: 'vm'
  params: {
    adminPassword: adminPassword
    adminUsername: adminUsername
    location: location
    name: name
    networkInterfaceId: virtualNetwork.outputs.networkInterfaceId
    vmSize: vmSize
  }
  dependsOn: [
    virtualNetwork
  ]
}
