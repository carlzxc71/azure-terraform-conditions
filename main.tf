terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.3.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = ""
}

module "st" {
  source                   = "./storage_account"
  environment              = "dev"
  location_short           = "we"
  location                 = "East US"
  account_tier             = "Premium"
  account_replication_type = "LRS"
}
