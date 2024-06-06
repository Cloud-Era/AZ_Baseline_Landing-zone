resource "azuread_group" "cloud_deployment" {
  for_each = var.ad_groups
  display_name     = each.value.group_name
  security_enabled = true
}

resource "azurerm_role_assignment" "role_assignment" {
  for_each = {
    for group_key, group_value in var.ad_groups : group_key => group_value.role_names
  }

  principal_id       = azuread_group.cloud_deployment[each.key].object_id
  role_definition_name = each.value
  scope              = "/subscriptions/${var.subscription_id}"
}
