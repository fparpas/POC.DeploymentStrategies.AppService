targetScope='subscription'

param resourceGroupName string
param resourceGroupLocation string
param appServiceName string

resource newRG 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
}

module storageAcct 'appservice.bicep' = {
  name: 'AppServiceModule'
  scope: newRG
  params: {
    appServiceName: appServiceName
    location: resourceGroupLocation
  }
}
