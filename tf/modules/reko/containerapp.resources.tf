resource "azurerm_container_app_environment" "main" {
  name                       = "cae-reko-${var.env}"
  location                   = azurerm_resource_group.main.location
  resource_group_name        = azurerm_resource_group.main.name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.main.id

  workload_profile {
    name = "Consumption"
    workload_profile_type = "Consumption"
    minimum_count = 0
    maximum_count = 10
  }
}

resource "azurerm_container_app" "main" {
  name                         = "ca-reko-inventory"
  container_app_environment_id = azurerm_container_app_environment.main.id
  resource_group_name          = azurerm_resource_group.main.name
  revision_mode                = "Single"

  identity {
    type = "UserAssigned"
    identity_ids = [ azurerm_user_assigned_identity.main.id ]
  }

  registry {
    server = data.azurerm_container_registry.main.login_server
    identity = azurerm_user_assigned_identity.main.id
  }

  template {
    container {
      name   = "reko-inventory"
      image  = "${azurerm_container_registry.main.login_server}/samples/quickstart:latest"
      cpu    = 0.25
      memory = "0.5Gi"
    }
  }

  depends_on = [ azurerm_role_assignment.acr_pull ]
}
