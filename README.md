az cli installation
```
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```
service principal create
```
az ad sp create-for-rbac --name "github-actions-sp" --role contributor --scope /subscriptions/$(az account show --query id -o tsv)/resourceGroups/rg-aca-iac-prod --json-auth
```
