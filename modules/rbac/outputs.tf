output "group_id" {
  description = "The ID of the Azure AD group."
  value       = var.create_group ? azuread_group.rbac_group[0].object_id : data.azuread_group.existing_group[0].object_id
}

output "role_assignment_ids" {
  description = "The IDs of the role assignments."
  value       = [for k, v in azurerm_role_assignment.role_assignment : v.id]
}
