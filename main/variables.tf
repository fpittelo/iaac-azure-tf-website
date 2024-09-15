#### Variables ######

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
  description = "value of resource group name"
  type = string
}

variable "az_sa_name" {
  description = "value of storage account name"
  type = string
}

variable "az_container_name" {
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
  default = "marketing-sp"
}

variable "wap_website_name" {
  description = "The name of the App Service"
  type        = string
}

variable "wap_sp_sku" {
  type = string
  default = "S1"
}

variable "wap_sp_sku_os_linux" {
  type = string
  default = "Linux"
}

variable "project" {
  type = string
  default = "iaac-azure-tf-website"
}

variable "owner" {
  type = string
  default = "Fred"
}

variable "department" {
  type = string
  default = "IT"
}

variable "wap_status" {
  description = "Project Status"
  type = string
}

variable "environment" {
  description = "The environment for deployment"
  type        = string
  default     = "dev"  # optional default value
}