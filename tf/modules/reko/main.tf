resource "azurerm_resource_group" "main" {
  name     = "rg-reko-${var.env}"
  location = "West Europe"
}

data "azurerm_client_config" "current" {}