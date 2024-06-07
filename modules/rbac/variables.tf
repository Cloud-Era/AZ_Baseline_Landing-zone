variable "group_name" {
  description = "This variable represents the name of the Azure AD group"
  type        = string
}

variable "create_group" {
  description = "his variable is a boolean flag used to determine whether to create a new Azure AD group (true) or use an existing one (false). The default value is set to true, providing a sensible default behavior."
  type        = bool
  default     = true
}

variable "role_assignments" {
  description = "Map of role assignments to apply. Each entry should include 'scope' and 'role_definition_name'."
  type = map(object({
    scope                = string
    role_definition_name = string
  }))
}
