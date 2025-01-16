variable "tgw_id" {
  description = "Transit Gateway ID"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "List of Subnet IDs"
  type        = list(string)
}

variable "environment" {
  description = "Environment name"
  type        = string
}
