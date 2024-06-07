terraform {
  backend "azurerm" {
    resource_group_name   = "my-tfstate-rg"
    storage_account_name  = "mytfstate"
    container_name        = "tfstate"
    key                   = "dev/terraform.tfstate"
  }
}
