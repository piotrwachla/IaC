# Ustawienie Providera Azure
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

# Resource Group (Grupa Zasobów) - używamy jej tylko do weryfikacji, czy istnieje
# resource "azurerm_resource_group" "rg" {
#   name     = var.resource_group_name
#   location = var.location
# }

# Używamy data source do pobrania istniejącej Resource Group
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}


# Azure Container Registry (ACR)
resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = true # Włączamy admin user dla prostszego logowania w CI/CD
}

# Container Apps Environment (Środowisko ACA)
resource "azurerm_container_app_environment" "aca_env" {
  name                = "aca-env-${var.resource_group_name}"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
}

# Container App - zasób ten będzie tylko zdefiniowany przez Terraform, 
# ale nie wdrożony, ponieważ zostanie zaktualizowany przez GitHub Actions w Etapie B.
resource "azurerm_container_app" "app" {
  name                         = "my-container-app-prod"
  resource_group_name          = data.azurerm_resource_group.rg.name
  container_app_environment_id = azurerm_container_app_environment.aca_env.id
  revision_mode                = "Single" # Lub 'Multiple' dla rewizji

  template {
    # Początkowa konfiguracja kontenera (zostanie nadpisana przez GitHub Actions)
    container {
      name   = "placeholder-app"
      image  = "${azurerm_container_registry.acr.login_server}/placeholder:latest"
      cpu    = 0.5
      memory = "1.0Gi"
    }
  }

  ingress {
    external_enabled = true
    target_port      = 8080 # Zmień na port, którego używa Twój kontener
    transport        = "Auto"
  }
}