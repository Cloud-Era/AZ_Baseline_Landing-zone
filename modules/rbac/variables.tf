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
