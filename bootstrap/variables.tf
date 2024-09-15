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
  default     = "iatbackend"
  type        = string
}

variable "az_backend_sa_name" {
  description = "Storage account name for the Terraform backend"
  default = "iatbackend"
  type        = string
}

variable "az_backend_container_name" {
  description = "value of container name"
  default = "iatbackend"
  type = string
}

variable "az_location" {
  description = "value of resource group location"
  default = "SwitzerlandNorth"
  type = string
}
