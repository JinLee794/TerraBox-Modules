variable "name" {
  type        = string
  description = "The name of the Role Definition. Changing this forces a new resource to be created."
}

variable "scope" {
  type        = string
  description = "The scope at which the Role Definition applies too, such as /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333, /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup, or /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup/providers/Microsoft.Compute/virtualMachines/myVM. It is recommended to use the first entry of the assignable_scopes. Changing this forces a new resource to be created."
}

variable "description" {
  type        = string
  description = "A description of the Role Definition."
  default     = null
}

variable "actions" {
  type        = list(any)
  description = "One or more Allowed Actions, such as *, Microsoft.Resources/subscriptions/resourceGroups/read. See 'Azure Resource Manager resource provider operations' for details."
  default     = []
}

variable "not_actions" {
  type        = list(any)
  description = "One or more Disallowed Actions, such as *, Microsoft.Resources/subscriptions/resourceGroups/read. See 'Azure Resource Manager resource provider operations' for details."
  default     = []
}
