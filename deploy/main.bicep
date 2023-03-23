param location string = resourceGroup().location
param storageDeploymentName string 
param webDeploymentName string 


module webapp1 'web.bicep' = {
  name: storageDeploymentName
  params: {
    name: 'jnicholls'
    environment: 'dev'
    costCenter: '12345'
    location: location
  }
}

module storage 'storage.bicep' = {
  name: webDeploymentName
  params: {
    name: 'jnicholls'
    environment: 'dev'
    costCenter: '12345'
    location: location
  }
}
