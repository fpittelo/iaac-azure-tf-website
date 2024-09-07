# providers.tf

terraform {
  backend "azurerm" {
    resource_group_name   = "iaac-azure-tf-website"    # Replace with your resource group name
    storage_account_name  = "iaac-azure-tf-website"   # Replace with your storage account name
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
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
      recover_soft_deleted_certificates = false
      recover_soft_deleted_keys = false
      recover_soft_deleted_secrets = false
    }
  }
  # Use OIDC authentication with the GitHub OIDC service principal
  use_oidc         = true
}

data "azurerm_client_config" "current" {}