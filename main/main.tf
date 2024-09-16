
######## Creation of Azure Web infrastructure  ########

resource "azurerm_resource_group" "rg" {
  name                 = var.az_backend_rg_name
  location             = var.az_location
  
  tags = {
    project            = var.project
    owner              = var.owner
    dept               = var.department
    status             = var.wap_status
  }
}

### Creation of Azure Service Plan #########
resource "azurerm_service_plan" "wap_sp_website" {
  name                = var.wap_sp_name
  location            = var.az_location
  resource_group_name = var.az_backend_rg_name
  sku_name            = var.wap_sp_sku
  os_type             = var.wap_sp_sku_os_linux
  
  depends_on = [azurerm_resource_group.rg]  # Explicit dependency

  tags = {
    project     = var.project
    owner       = var.owner
    dept        = var.department
    status      = var.wap_status
  }
}
###### Creation of Azure App Service ######
resource "azurerm_linux_web_app" "wap_website" {
  name                = var.wap_website_name
  resource_group_name = var.az_backend_rg_name
  location            = var.az_location
  service_plan_id     = azurerm_service_plan.wap_sp_website.id

  depends_on = [azurerm_service_plan.wap_sp_website]  # Explicit dependency

  tags = {
    project     = var.project
    owner       = var.owner
    dept        = var.department
    status      = var.wap_status
  }

  site_config {
    default_documents = ["index.html","index.htm"]
    application_stack {
      php_version = "8.2"
    }
  }
}

##### Creation of Azure Web App Slot qa ####
#resource "azurerm_linux_web_app_slot" "qa" {
# name            = "qa"
# app_service_id  = azurerm_linux_web_app.wap_website.id
# 
# tags = {
#   project     = var.project
#   owner       = var.owner
#   dept        = var.department
#   status      = var.wap_status_dv
# }
# site_config {
#   default_documents = ["index.html","index.htm"]
#   application_stack {
#     php_version = "8.2"
#   }
# }
#}

##### Creation of Azure Web App Slot dev ####
#resource "azurerm_linux_web_app_slot" "dev" {
# name            = "dev"
# app_service_id  = azurerm_linux_web_app.wap_website.id
  
# tags = {
#   project     = var.project
#   owner       = var.owner
#   dept        = var.department
#   status      = var.wap_status_dv
# }

# site_config {
#   default_documents = ["index.html","index.htm"]
#   application_stack {
#     php_version = "8.2"
#   }
# }
#}