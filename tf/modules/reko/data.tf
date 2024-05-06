data "azurerm_container_registry" "main" {
  name                = var.acr_name
  resource_group_name = var.infra_resource_group_name
}
