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

variable "nsg_names" {
  description = "Map of NSG names"
  type        = map(string)
}

variable "rt_names" {
  description = "Map of route table names"
  type        = map(string)
}

variable "swimlane_udr_names" {
  description = "Map of Swimlane UDR names"
  type        = map(string)
}

variable "subnet_names" {
  description = "List of subnet names"
  type        = list(string)
  default     = ["apim", "private"]
}

variable "subnet_cidrs" {
  description = "Map of subnet CIDRs"
  type        = map(string)
}

variable "subnet_nsg_aliases" {
  description = "Map of subnet NSG aliases"
  type        = map(string)
}

variable "subnet_route_table_aliases" {
  description = "Map of subnet route table aliases"
  type        = map(string)
}

variable "subnet_service_endpoints" {
  description = "Map of subnet service endpoints"
  type        = map(list(string))
}

variable "subnet_enforce_private_link_service_network_policies" {
  description = "Map of subnet enforce private link service network policies"
  type        = map(bool)
}

variable "subnet_enforce_private_link_endpoint_network_policies" {
  description = "Map of subnet enforce private link endpoint network policies"
  type        = map(bool)
}
