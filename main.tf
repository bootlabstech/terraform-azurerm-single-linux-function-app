


resource "azurerm_linux_function_app" "example" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  virtual_network_subnet_id = var.virtual_network_subnet_id
  https_only = var.https_only

  storage_account_name       = var.storage_accountid
  service_plan_id            = var.app_service_planid
  
  site_config {
    ftps_state             = var.ftps_state
    app_command_line       = var.app_command_line
    app_scale_limit        = var.app_scale_limit
    vnet_route_all_enabled = var.vnet_route_all_enabled
  }
  lifecycle {
    ignore_changes = [
      site_config,
      identity,
      app_settings,
    ]
  }

 

  
}
# resource "azurerm_storage_account" "storage_account" {
#   name                          = var.storage_name
#   resource_group_name           = var.resource_group_name
#   location                      = var.location
#   account_tier                  = var.account_tier
#   account_replication_type      = var.account_replication_type
#   public_network_access_enabled = var.public_network_access_enabled

#   lifecycle {
#     ignore_changes = [
#       tags,
#     ]
#   }
# }

# resource "azurerm_app_service_plan" "app_service_plan" {
#   name                = var.plan_name
#   resource_group_name = var.resource_group_name
#   location            = var.location
#   kind                = var.kind
#   reserved            = var.reserved

#   sku {
#     tier = var.tier
#     size = var.size
#   }

#   lifecycle {
#     ignore_changes = [
#       tags,
#     ]
#   }
# }


