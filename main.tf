
######## Creation of Azure Web infrastructure  ########

######## Creation of Azure Key Vault ########

resource "azurerm_key_vault" "website_vault" {
  name                              = "alibaba"
  resource_group_name               = var.az_rg_name
  location                          = var.az_rg_location
  tenant_id                         = data.azurerm_client_config.current.tenant_id
  sku_name                          = "standard"
  enabled_for_deployment            = true
  enabled_for_disk_encryption       = false
  enabled_for_template_deployment   = false
  soft_delete_retention_days        = 7
  purge_protection_enabled          = false
  public_network_access_enabled     = false

  access_policy = [{
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    application_id = null  # If not using an application, this can be set to null

    certificate_permissions = [
      "Get",
      "List",
      "Create",
      "Update",
      "Delete",
      "Purge",
    ]

    key_permissions = [
      "Get",  # Add appropriate key permissions here; required even if empty
    ]

    secret_permissions = [
      "Get",  # Add appropriate secret permissions here; required even if empty
    ]

    storage_permissions = [
      "Get",  # Add appropriate storage permissions here; required even if empty
    ]
  }]
}

### Creation of Azure Service Plan #########
resource "azurerm_service_plan" "wap_sp_website" {
  name                = var.wap_sp_name
  location            = var.az_rg_location
  resource_group_name = var.az_rg_name
  sku_name            = var.wap_sp_sku
  os_type             = var.wap_sp_sku_os_linux

  tags = {
    project     = var.project
    owner       = var.owner
    dept        = var.department
  }
}
###### Creation of Azure Website ######
resource "azurerm_linux_web_app" "wap_website" {
  name                = var.wap_website_name
  resource_group_name = var.az_rg_name
  location            = var.az_rg_location
  service_plan_id     = azurerm_service_plan.wap_sp_website.id

  tags = {
    project     = var.project
    owner       = var.owner
    dept        = var.department
    status      = var.wap_status_dv
  }

  site_config {
    default_documents = ["index.html","index.htm"]
    application_stack {
      php_version = "8.2"
    }
  }
}
##### Creation of Azure Web App Slot qa ####
resource "azurerm_linux_web_app_slot" "qa" {
  name            = "qa"
  app_service_id  = azurerm_linux_web_app.wap_website.id
  
  tags = {
    project     = var.project
    owner       = var.owner
    dept        = var.department
    status      = var.wap_status_dv
  }
  site_config {
    default_documents = ["index.html","index.htm"]
    application_stack {
      php_version = "8.2"
    }
  }
}

##### Creation of Azure Web App Slot qa ####
resource "azurerm_linux_web_app_slot" "dev" {
  name            = "dev"
  app_service_id  = azurerm_linux_web_app.wap_website.id
  
  tags = {
    project     = var.project
    owner       = var.owner
    dept        = var.department
    status      = var.wap_status_dv
  }

  site_config {
    default_documents = ["index.html","index.htm"]
    application_stack {
      php_version = "8.2"
    }
  }
}