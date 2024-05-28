variable "location" {
  description = "The Azure region to deploy resources."
  type        = string
}

variable "vnet_name" {
  description = "Name of the virtual network."
  type        = string
}

variable "resource_group" {
  description = "Name of the resource group."
  type        = string
}

variable "vnet_address_space" {
  description = "Address space of the virtual network."
  type        = list(string)
}

variable "subnets" {
  description = "List of subnets."
  type        = list(object({
    name          = string
    address_prefix = string
  }))
}
