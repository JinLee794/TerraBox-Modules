data "azuread_client_config" "current" {}

resource "azuread_application" "this" {
  display_name    = var.display_name
  identifier_uris = var.identifier_uris
  owners          = [data.azuread_client_config.current.object_id]

  sign_in_audience = var.sign_in_audience

  // tags = var.tags
}

resource "azuread_service_principal" "this" {
  application_id = azuread_application.this.application_id
  use_existing   = true
}
