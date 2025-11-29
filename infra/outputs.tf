output "acr_login_server" {
  description = "Login server for ACR (used by GitHub Actions)"
  value       = azurerm_container_registry.acr.login_server
}
output "container_app_name" {
  description = "Name of the Container App"
  value       = azurerm_container_app.app.name
}
output "resource_group_name" {
  description = "Name of the Resource Group"
  value       = data.azurerm_resource_group.rg.name
}
output "aca_environment_name" {
  description = "Name of the Container Apps Environment"
  value       = azurerm_container_app_environment.aca_env.name
}