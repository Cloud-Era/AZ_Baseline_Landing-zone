variable "scope" {
  description = "Scope at which the role assignment is created."
  type        = string
}

variable "role_definition_name" {
  description = "Name of the role definition to assign."
  type        = string
}

variable "principal_id" {
  description = "ID of the principal to assign the role to."
  type        = string
}
###############
variable "tenant_id" {
  description = "The tenant ID for Azure"
  type        = string
}

variable "subscription_id" {
  description = "The subscription ID where resources will be deployed"
  type        = string
}

variable "ad_groups" {
  description = "Map of AD group names and their corresponding roles"
  type = map(object({
    group_name = string
    role_names = list(string)
  }))
}

variable "location" {
  description = "The Azure region location"
  type        = string
}

variable "env_name" {
  description = "The environment name (e.g., dev, qa, prod)"
  type        = string
}
