# providers.tf

terraform {
  backend "azurerm" {
    resource_group_name   = var.az_rg_name          # Replace with your resource group name
    storage_account_name  = var.az_sa_name          # Replace with your storage account name
    container_name        = var.az_container_name   # Replace with your container name
    key                   = var.terraform_key       # Replace with your Terraform state file name
    region                = var.az_rg_location      # Replace with your resource group location
    subscription_id       = var.az_subscription_id  # Replace with your subscription ID
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
  use_oidc  = true

}

data "azurerm_client_config" "current" {}