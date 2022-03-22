resource "azurerm_management_group" "this" {
  display_name               = var.name
  group_id                   = var.group_id
  parent_management_group_id = var.parent_management_group_id
  subscription_ids           = var.subscription_ids
}
