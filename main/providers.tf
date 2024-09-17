# providers.tf

terraform {
  backend "azurerm" {
    resource_group_name   = "backend4main"            # Replace with your resource group name
    storage_account_name  = "backend4main"         # Replace with your storage account name
    container_name        = "backend4main"             # Replace with your container name
    key                   = "backend4main.tfstate"     # Replace with your Terraform state file name
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
}