# Variable definitions for the Terraform configuration

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

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "location" {
  description = "Azure region location"
  type        = string
}

variable "subnets" {
  description = "Map of subnets with their configurations"
  type = map(object({
    subnet_name                           = string
    cidr                                  = string
    nsg_alias                             = string
    route_table_alias                     = string
    delegation_name                       = string
    delegation_sd_name                    = string
    delegation_sd_action                  = list(string)
    service_endpoints                     = list(string)
    enforce_private_link_service_network_policies = bool
    enforce_private_link_endpoint_network_policies = bool
  }))
}

variable "nsg_names" {
  description = "Map of Network Security Group (NSG) names"
  type        = map(string)
}

variable "swimlane_udr_names" {
  description = "Map of User-Defined Route (UDR) names"
  type        = map(string)
}
variable "nsg_services" {
  description = "Network Security Group (NSG) services configuration"
  type        = map(object({
    extra_templates = list(string)
    variables       = map(any)
    name            = string
  }))
}
variable "tenant_id" {
  description = "The tenant ID of the Azure AD."
  type        = string
}

variable "aad_groups" {
  description = "Map of Azure AD group names to look up."
  type        = map(string)
}

variable "role_assignments" {
  description = "Map of role assignments, where keys are assignment names and values are objects containing scope, role definition name, and principal ID."
  type = map(object({
    scope                = string
    role_definition_name = string
    principal_id         = string
  }))