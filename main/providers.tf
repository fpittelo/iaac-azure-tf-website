# providers.tf

terraform {
  backend "azurerm" {
    resource_group_name   = "iatbackend"             # Replace with your resource group name
    storage_account_name  = "iatbackend4dev"          # Replace with your storage account name
    container_name        = "iatbackend"             # Replace with your container name
    key                   = "iatbackend.tfstate"     # Replace with your Terraform state file name
  }

  required_providers {
    azurerm   = {
      source  = "hashicorp/azurerm"
      version = "~> 3.8"  # Use the appropriate version
    }
  }
}

provider "azurerm" {
  features {}
  # Use OIDC authentication with the GitHub OIDC service principal
  # use_oidc          = true
  # client_id         = var.az_client_id       # Assuming client_id is passed as a variable if needed
  # tenant_id         = var.az_tenant_id       # Assuming tenant_id is passed as a variable if needed
  # subscription_id   = var.az_subscription_id # Use the subscription_id variable
}

# data "azurerm_client_config" "current" {}