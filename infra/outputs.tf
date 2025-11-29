output "acr_login_server" {
  description = "Login server for ACR (used by GitHub Actions)"
  value       = azurerm_container_registry.acr.login_server
}
output "acr_name" {
  description = "Name of the ACR"
  value       = azurerm_container_registry.acr.name
}
output "resource_group_name" {
  description = "Name of the Resource Group"
  value       = azurerm_resource_group.rg.name
}
output "aca_environment_name" {
  description = "Name of the Container Apps Environment"
  value       = azurerm_container_app_environment.aca_env.name
}