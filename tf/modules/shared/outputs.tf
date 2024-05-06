output "resource_group_name" {
  value = azurerm_resource_group.main.name
  description = "Name of the resource group"
}

output "acr_name" {
  value = azurerm_container_registry.main.name
  description = "Name of the container registry"
}