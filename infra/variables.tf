#### Variables ######

variable "tags" {
  description = "Tags to apply to Key Vault resources"
  type        = map(string)
  default     = {}  # Set default to empty map if appropriate
}

variable "az_subscription_id" {
  description = "value of subscription id"
  type = string
}

variable "az_client_id" {
  description = "value of subscription id"
  type = string
}

variable "az_tenant_id" {
  description = "value of subscription id"
  type = string
}

variable "az_backend_rg_name" {
  description = "Resource group name for the Terraform backend storage"
  type        = string
}

variable "az_backend_sa_name" {
  description = "Storage account name for the Terraform backend"
  type        = string
}

variable "az_backend_container_name" {
  description = "value of container name"
  type = string
}

variable "az_rg_name" {
  description = "value of container name"
  type = string
}


variable "terraform_key" {
  description = "value of terraform state file name"
  type = string
}

variable "az_location" {
  description = "value of resource group location"
  type = string
}

variable "wap_sp_name" {
  type = string
}

variable "wap_website_name" {
  description = "The name of the App Service"
  type        = string
}

variable "wap_sp_sku" {
  description = "value of sku name"
  type = string
}

variable "wap_sp_sku_os_linux" {
  description = "value of os type"
  type = string
}

variable "project" {
  description = "value of project"
  type = string
}

variable "owner" {
  description = "value of the owner"
  type = string
}

variable "department" {
  description = "value of department"
  type = string
}