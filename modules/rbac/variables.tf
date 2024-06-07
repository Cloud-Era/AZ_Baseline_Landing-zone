variable "group_name" {
  description = "The name of the Azure AD group."
  type        = string
}

variable "create_group" {
  description = "Flag to determine whether to create a new group or use an existing one."
  type        = bool
  default     = true
}

variable "roles" {
  description = "A map of roles to assign to the group, where keys are identifiers and values are role names."
  type        = map(string)
}

variable "scope" {
  description = "The scope at which the role assignment applies."
  type        = string
}
