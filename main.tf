data "azurerm_storage_account" "func_sa" {
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_linux_function_app" "example" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location

  service_plan_id            = var.app_service_planid
  storage_account_name       = var.storage_account_name
  storage_account_access_key = data.azurerm_storage_account.func_sa.primary_access_key


  https_only = var.https_only
  functions_extension_version = "~4"

  virtual_network_subnet_id = var.virtual_network_subnet_id
  public_network_access_enabled = var.public_network_access_enabled
  app_settings = {
    FUNCTIONS_WORKER_RUNTIME = var.runtime_stack
    WEBSITE_RUN_FROM_PACKAGE = "1"
  }

  site_config {
    ftps_state             = var.ftps_state
    app_command_line       = var.app_command_line
    app_scale_limit        = var.app_scale_limit
    vnet_route_all_enabled = var.vnet_route_all_enabled

    dynamic "application_stack" {
      for_each = [1]
      content {
        python_version = var.runtime_stack == "python" ? var.runtime_version : null
        node_version   = var.runtime_stack == "node"   ? var.runtime_version : null
        dotnet_version = var.runtime_stack == "dotnet" ? var.runtime_version : null
        java_version   = var.runtime_stack == "java"   ? var.runtime_version : null
      }
    }
  }
}