variable "resource_group_name" {
  description = "Nazwa Resource Group."
  default     = "rg-aca-iac-prod"
}
variable "location" {
  description = "Region Azure."
  default     = "westeurope"
}
variable "acr_name" {
  description = "Unikalna nazwa Azure Container Registry."
  default     = "myappregistryiac12345dupadupadupa" # Zmień na UNIKALNĄ NAZWĘ
}