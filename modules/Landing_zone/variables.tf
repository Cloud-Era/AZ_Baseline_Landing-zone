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
variable "rg_name" {
  description = "The name of the resource group."
  type        = string
  default     = var.create_rg ? azurerm_resource_group.example[0].name : var.rg_name
}


variable "create_group" {
  description = "Flag to determine whether to create a new Azure AD group if it doesn't exist."
  type        = bool
  default     = true
}

variable "roles" {
  description = "A map of roles to assign to the group, where keys are identifiers and values are role names."
  type        = map(object({
    scope                = string
    role_definition_name = string
  }))
}

variable "rg_name" {
  description = "The name of the resource group."
  type        = string
}

variable "azure_ad_group_name" {
  description = "The name of the Azure AD group."
  type        = string
}

variable "scope" {
  description = "The scope for role assignments."
  type        = string
  default     = var.create_rg ? azurerm_resource_group.example[0].id : null
}
