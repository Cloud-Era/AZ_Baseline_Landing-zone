provider "azurerm" {
  features {}
}

module "landing_zone" {
  source = "../../modules/landing_zone"
  # Add necessary variables
}

module "network" {
  source = "../../modules/network"
  # Add necessary variables
}

module "rbac" {
  source = "../../modules/rbac"
  # Add necessary variables
}
