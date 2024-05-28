resource "azurerm_resource_group" "system" {
  name     = var.system_rg_name
  location = var.location
}

resource "azurerm_resource_group" "app" {
  name     = var.app_rg_name
  location = var.location
}

# Define more resources as needed
