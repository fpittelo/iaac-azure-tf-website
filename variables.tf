
variable "az_rg_name" {
  type = string
  default = "LABS"
}

variable "az_sa_name" {
  type = string
  default = "iaaclabs"
}

variable "az_container_name" {
  type = string
  default = "iaac-azure-tf-website"
}

variable "terraform_key" {
  type = string
  default = "terraform.tfstate"
}

variable "az_rg_location" {
  type = string
  default = "switzerlandnorth"
}

variable "wap_sp_name" {
  type = string
  default = "iaac-azure-tf-website"
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
  default = "website"
}

variable "owner" {
  type = string
  default = "Fred"
}

variable "department" {
  type = string
  default = "IT"
}

variable "wap_status_dv" {
  type = string
  default = "development"
}

variable "wap_status_qa" {
  type = string
  default = "quality"
}

variable "wap_status_pd" {
  type = string
  default = "production"
}