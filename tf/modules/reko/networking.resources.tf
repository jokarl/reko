resource "azurerm_network_security_group" "main" {
  name                = "nsg-reko-cae"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_virtual_network" "main" {
  name                = "vnet-reko-${var.env}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = ["10.0.0.0/16"]

  subnet {
    name           = "snet-cae"
    address_prefix = "10.0.0.0/21"
    security_group = azurerm_network_security_group.main.id
  }
}