variable "resource_group_name" {
  description = "Nazwa Resource Group."
  default     = "rg-aca-iac-prod"
}
variable "location" {
  description = "Region Azure."
  default     = "West Europe"
}
variable "acr_name" {
  description = "Unikalna nazwa Azure Container Registry."
  default     = "myappregistryiac12345" # Zmień na UNIKALNĄ NAZWĘ
}