variable "eonid" {
  description = "Eon ID"
  type        = string
}

variable "location" {
  description = "Location"
  type        = string
}

variable "lz_name" {
  description = "Landing Zone Name"
  type        = string
}

variable "short_name" {
  description = "Short Name"
  type        = string
}

variable "short_env" {
  description = "Short Environment"
  type        = string
}

variable "env_name" {
  description = "Environment Name"
  type        = string
}

variable "vnet_address_prefix" {
  description = "VNet Address Prefix"
  type        = string
}

variable "subnets" {
  description = "Map of subnet configurations"
  type        = map(object({
    cidr                                  = string
    nsg_alias                             = string
    route_table_alias                     = string
    service_endpoints                     = list(string)
    enforce_private_link_service_network_policies = string
    enforce_private_link_endpoint_network_policies = string
  }))
}

variable "nsg_names" {
  description = "Map of NSG names"
  type        = map(string)
}

variable "swimlane_udr_names" {
  description = "Map of Swimlane UDR names"
  type        = map(string)
}
