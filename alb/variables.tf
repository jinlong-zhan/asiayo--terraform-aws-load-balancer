variable "vpc_id" {
  description = "The VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "security_group" {
  description = "Security group ID"
  type        = string
}

variable "target_instances" {
  description = "List of target instance IDs"
  type        = list(string)
}

