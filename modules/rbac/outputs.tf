output "group_id" {
  description = "The ID of the Azure AD group."
  value       = var.create_group ? azuread_group.rbac_group[0].object_id : data.azuread_group.existing_group[0].object_id
}

output "role_assignments" {
  description = "The role assignments."
  value       = azurerm_role_assignment.role_assignment
}
