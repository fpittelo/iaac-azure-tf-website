# providers.tf

terraform {
  backend "azurerm" {
    use_oidc = true
  }

  required_providers {
    azurerm   = {
      source  = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }    
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = false
    }
 }
}