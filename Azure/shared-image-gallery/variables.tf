variable "name" {
  type        = string
  description = "(Required) Specifies the name of the Shared Image Gallery. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the Shared Image Gallery. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  default     = ""
}

variable "description" {
  type        = string
  description = "(Optional) A description for this Shared Image Gallery."
  default     = ""
}

variable "tags" {
  type        = map(any)
  description = "(Optional) A mapping of tags to assign to the Shared Image Gallery."
  default     = {}
}
