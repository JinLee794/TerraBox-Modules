variable "name" {
  type        = string
  description = "The name or UUID for this Management Group, which needs to be unique across your tenant. A new UUID will be generated if not provided. Changing this forces a new resource to be created."
  default     = null
}

variable "group_id" {
  type        = string
  description = "The name or UUID for this Management Group, which needs to be unique across your tenant. A new UUID will be generated if not provided. Changing this forces a new resource to be created."
  default     = null
}

variable "parent_management_group_id" {
  type        = string
  description = "The ID of the Parent Management Group. Changing this forces a new resource to be created."
  default     = null
}

variable "subscription_ids" {
  type        = list(string)
  description = "A list of Subscription GUIDs which should be assigned to the Management Group."
  default     = []
}
