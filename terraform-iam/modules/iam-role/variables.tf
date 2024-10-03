variable "role_name" {
  description = "Name of the IAM Role"
  type        = string
}

variable "assume_role_policy" {
  description = "IAM assume role policy"
  type        = string
}

variable "inline_policies" {
  description = "List of inline policies to attach to the role"
  type = list(object({
    name   = string
    policy = string
  }))
  default = []
}

variable "managed_policy_arns" {
  description = "List of managed policy ARNs to attach to the role"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags to associate with the IAM role"
  type        = map(string)
  default     = {}
}
