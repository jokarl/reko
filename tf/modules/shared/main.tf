resource "azurerm_resource_group" "main" {
  name     = "rg-reko"
  location = "West Europe"
}

resource "azurerm_container_registry" "main" {
  name                = "crreko"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  sku                 = "Basic"
  admin_enabled       = false
}