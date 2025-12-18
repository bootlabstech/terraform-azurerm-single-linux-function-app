# terraform {
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = ">= 4.0.0"
#     }
#   }
# }

# provider "azurerm" {
#   features {}

# }

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version =  ">= 4.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
  subscription_id = "d7362f78-3fd1-413c-8adc-149b8f3446c8"

}
