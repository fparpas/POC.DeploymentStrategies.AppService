param location string = resourceGroup().location // Location for all resources 
param appServiceName string

resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: '${appServiceName}Plan'
  location: location
  properties: {
    reserved: true
  }
  sku: {
    name: 'S1'
    capacity: 1
  }
  kind: 'linux'
}

resource webApplication 'Microsoft.Web/sites@2018-11-01' = {
  name: appServiceName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
  }
  kind: 'app,linux'
}

resource Staging 'Microsoft.Web/sites/slots@2022-03-01' = {
  name: '${webApplication.name}/Staging'
  kind: 'app,linux'
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    }

}
