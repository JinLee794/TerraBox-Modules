variable "subscription_name" {
  type        = string
  description = "The Name of the Subscription. This is the Display Name in the portal."
}

variable "subscription_id" {
  type        = string
  description = "The Name of the Subscription. This is the Display Name in the portal."
  default     = null
}

variable "tags" {
  type        = map(any)
  description = "A mapping of tags to assign to the Subscription."
  default     = {}
}
