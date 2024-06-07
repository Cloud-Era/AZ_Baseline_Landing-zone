# Resource to create an Azure AD group if the create_group flag is set to true
resource "azuread_group" "rbac_group" {
  count            = var.create_group ? 1 : 0
  display_name     = var.group_name
  security_enabled = true
}

# Data source to retrieve an existing Azure AD group if the create_group flag is set to false
data "azuread_group" "existing_group" {
  count        = var.create_group ? 0 : 1
  display_name = var.group_name
}

# Resource to assign roles to the specified Azure AD group at the given scope
resource "azurerm_role_assignment" "role_assignment" {
  for_each             = var.roles
  scope                = var.scope
  role_definition_name = each.value
  principal_id         = var.create_group ? azuread_group.rbac_group[0].object_id : data.azuread_group.existing_group[0].object_id

  depends_on = [
    azuread_group.rbac_group,
    data.azuread_group.existing_group
  ]
}
