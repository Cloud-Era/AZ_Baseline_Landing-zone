terraform {
  required_providers {
    azurerm = {
      version = "3.75.0"
      source  = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  skip_provider_registration   = true
  disable_terraform_partner_id = true
  features {}
}

provider "azuread" {
  tenant_id = var.tenant_id
}
