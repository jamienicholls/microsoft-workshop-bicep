@allowed([
  'dev'
  'test'
  'prod'
])
param environment string
param costCenter string
param location string = resourceGroup().location
param name string = 'jnicholls'

var storageSkuName = (environment == 'prod') ? 'Standard_GRS' : 'Standard_LRS'
var tags = {
  Environment: environment
  CostCenter: costCenter
  application: name
}

resource myStorageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  kind: 'StorageV2'
  location: location
  name: 'stor${name}${environment}0230323'
  sku: {
    name: storageSkuName
  }
  tags: tags
}


output myStorageAccountId string = myStorageAccount.id
