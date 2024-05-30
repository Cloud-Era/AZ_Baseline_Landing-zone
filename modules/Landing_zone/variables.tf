variable "lz_name" {
  description = "Name of the landing zone"
  type        = string
}

variable "short_name" {
  description = "Short name for the landing zone"
  type        = string
}

variable "short_env" {
  description = "Short environment name"
  type        = string
}

variable "env_name" {
  description = "Environment name"
  type        = string
}

variable "vnet_address_prefix" {
  description = "Address prefix for the VNet"
  type        = string
}

variable "eonid" {
  description = "EON ID for tagging"
  type        = string
}

variable "subnets" {
  description = "Map of subnets"
  type = map(object({
    cidr                                   = string
    nsg_alias                              = string
    route_table_alias                      = string
    service_endpoints                      = list(string)
    enforce_private_link_service_network_policies = bool
    enforce_private_link_endpoint_network_policies = bool
  }))
}
