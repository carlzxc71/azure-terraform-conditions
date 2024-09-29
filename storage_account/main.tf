resource "azurerm_resource_group" "this" {
  name     = "rg-${var.environment}-${var.location_short}-conditiondemo"
  location = var.location
}

resource "azurerm_storage_account" "this" {
  name                     = "st${var.environment}${var.location_short}demo1337"
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  lifecycle {
    precondition {
      condition     = contains(["westeurope", "swedencentral"], var.location)
      error_message = "Allowed resource locations are West Europe and Sweden Central."
    }
  }
}
