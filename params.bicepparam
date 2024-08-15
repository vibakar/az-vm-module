using 'main.bicep'

param addressPrefixes = [
  '10.0.0.0/16'
]
param adminPassword = 'myAdminPassword123'
param adminUsername = 'adminUsername'
param location = 'uksouth'
param name = 'test'
param subnets = [
  '10.0.0.0/24'
]
param vmSize = 'Standard_A4_v2'
