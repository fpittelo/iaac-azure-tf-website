provider "azurerm" {
  alias   = "bootstrap"
  features {}
  use_oidc = true
  client_id         = var.az_client_id       # Assuming client_id is passed as a variable if needed
  tenant_id         = var.az_tenant_id       # Assuming tenant_id is passed as a variable if needed
  subscription_id   = var.az_subscription_id  # Use the subscription_id variable
}