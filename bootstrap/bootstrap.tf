provider "azurerm" {
  alias   = "bootstrap"
  features {}
  use_oidc = true
}

resource "azurerm_resource_group" "backend_rg" {
  provider = azurerm.bootstrap
  name     = var.az_backend_rg_name
  location = var.az_location
}

resource "azurerm_storage_account" "backend_sa" {
  provider                  = azurerm.bootstrap
  name                     = var.az_backend_container_name
  resource_group_name      = var.az_backend_rg_name
  location                 = var.az_location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "backend_container" {
  provider              = azurerm.bootstrap
  name                  = var.az_backend_container_name
  storage_account_name  = var.az_backend_container_name
  container_access_type = "private"
}
