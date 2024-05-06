terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.102.0"
    }
  }

#   backend "azurerm" {
#     container_name = "tfstate"
#     key            = "reko.terraform.tfstate"
#     use_oidc       = true
#   }
}

provider "azurerm" {
  use_oidc                     = true
  disable_terraform_partner_id = true
  storage_use_azuread          = true
  skip_provider_registration   = false
  features {
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }
}
