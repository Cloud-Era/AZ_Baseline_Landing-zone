variable "location" {
  description = "The Azure region to deploy resources."
  type        = string
}

variable "system_rg_name" {
  description = "Name of the system resource group."
  type        = string
}

variable "app_rg_name" {
  description = "Name of the app resource group."
  type        = string
}
