provider "azurerm" {
  features {}
}

variable "az_backend_rg_name" {
  description = "Resource group name for the Terraform backend storage"
  type        = string
}

variable "az_backend_sa_name" {
  description = "Storage account name for the Terraform backend"
  type        = string
}

variable "az_locationlocation" {
  description = "Location for the resources"
  type        = string
}

resource "azurerm_resource_group" "backend_rg" {
  name     = var.az_backend_rg_name
  location = var.az_locationlocation
}

resource "azurerm_storage_account" "backend_sa" {
  name                     = var.az_sa_name
  resource_group_name      = var.az_backend_rg_name
  location                 = var.az_location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "backend_container" {
  name                  = var.az_backend_container_name
  storage_account_name  = var.az_sa_name
  container_access_type = "private"
}
