terraform {
  required_providers {
    azurerm = "~> 2.93.0"
  }
}

resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}
