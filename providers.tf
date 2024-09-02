# providers.tf

terraform {
  backend "azurerm" {
    resource_group_name   = var.az_rg_name    # Replace with your resource group name
    storage_account_name  = var.az_sa_name   # Replace with your storage account name
    container_name        = var.az_container_name
    key                   = var.terraform_key
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.8"  # Use the appropriate version
    }
  }
}

provider "azurerm" {
  features {}

  # Configuring the provider to use OIDC authentication with the GitHub OIDC service principal
  use_oidc         = true
}
