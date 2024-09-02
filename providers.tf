# providers.tf

terraform {
  backend "azurerm" {
    resource_group_name   = "LABS"    # Replace with your resource group name
    storage_account_name  = "iaaclabs"   # Replace with your storage account name
    container_name        = "iaac-azure-tf-website"
    key                   = "terraform.tfstate"
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
