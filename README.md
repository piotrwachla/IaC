az cli installation
```
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```
azure connection
```
az login
```
resource group create
```
az group create --name rg-aca-iac-prod --location westeurope
```
service principal create
```
az ad sp create-for-rbac --name "github-actions-sp" --role contributor --scope /subscriptions/$(az account show --query id -o tsv)/resourceGroups/rg-aca-iac-prod --json-auth
```
azure credentials
github->settings->secrets and variables->actions->AZURE_CREDENTIALS
```
{
  "clientId": "82fee095-ed09-4a05-8828-1de8e8b06812",
  "clientSecret": "cvV8Q~pDw1Ze2PfG--3LrgKAyNeuqqFw8BONOb~1",
  "subscriptionId": "c277e83f-11ec-41bb-b18f-788be812fe87",
  "tenantId": "79823bca-74fa-4935-bd7c-8729832c5923",
  "activeDirectoryEndpointUrl": "https://login.microsoftonline.com",
  "resourceManagerEndpointUrl": "https://management.azure.com/",
  "activeDirectoryGraphResourceId": "https://graph.windows.net/",
  "sqlManagementEndpointUrl": "https://management.core.windows.net:8443/",
  "galleryEndpointUrl": "https://gallery.azure.com/",
  "managementEndpointUrl": "https://management.core.windows.net/"
}
```