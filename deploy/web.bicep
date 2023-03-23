@allowed([
  'dev'
  'test'
  'prod'
])
param environment string
param name string = 'jnicholl'
param costCenter string
param location string = resourceGroup().location

var aspSkuName = (environment == 'prod') ? 'S1' : 'F1'
var tags = {
  Environment: environment
  CostCenter: costCenter
  Application: name
}


resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'asp-${name}-${environment}-230323'
  location: location
  tags: tags
  sku:{
    name: aspSkuName
  }
}

resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: 'app-${name}-${environment}-001'
  location: location
  properties: {
    serverFarmId: appServicePlan.id
  }
  tags: tags
}


output appServicePlanId string = appServicePlan.id
output webAppId string = webApp.id

