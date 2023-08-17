variable "name" {
  description = "Name of the SNS topic"
  type        = string
}

variable "display_name" {
  description = "Display name for the SNS topic"
  type        = string
  default     = ""
}

variable "delivery_policy" {
  description = "Map representing the delivery policy for the topic"
  type        = map(any)
  default     = null
}

variable "tags" {
  description = "Tags to assign to the topic"
  type        = map(string)
  default     = {}
}
