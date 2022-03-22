variable "key_vault_name" {
  type        = string
  description = "Specifies the name of the Key Vault. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the Key Vault. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "The Azure region to deploy to. Recommendation is to set to the same location as the resource group."
  default     = ""
}

variable "sku_name" {
  type        = string
  description = "The Name of the SKU used for this Key Vault. Possible values are standard and premium."
  default     = "standard"
}

variable "tags" {
  type        = map(any)
  description = "Map of key value pairs for the resource tagging. Default: none."
  default     = {}
}
