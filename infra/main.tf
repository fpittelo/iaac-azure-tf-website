
######## Creation of Azure Web infrastructure  ########

#### Create Azure Resource Group ######

resource "azurerm_resource_group" "rg" {
  name            = var.az_rg_name
  location        = var.az_location

  tags = var.tags
}

### Creation of Azure Service Plan #########
module "app_service_plan" {
  source = "../modules/app_service_plan"
  wap_sp_name           = var.wap_sp_name
  wap_sp_sku            = var.wap_sp_sku
  wap_sp_sku_os_linux   = var.wap_sp_sku_os_linux
  az_location           = var.az_location
  az_rg_name            = var.az_rg_name

  tags = var.tags

  depends_on = [ azurerm_resource_group.rg ]
}

###### Creation of Azure Linux Web App ######
module "linux_web_app" {
  source = "../modules/linux_web_app"
  wap_website_name    = var.wap_website_name
  service_plan_id     = module.app_service_plan.service_plan_id
  wap_sp_name         = var.wap_sp_name
  az_rg_name          = var.az_rg_name
  az_location         = var.az_location

  tags = var.tags

  depends_on = [module.app_service_plan]  # Explicit dependency
}