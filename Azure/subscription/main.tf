resource "azurerm_subscription" "this" {
  alias             = var.subscription_name
  subscription_name = var.subscription_name
  subscription_id   = var.subscription_id

  tags = var.tags
}
