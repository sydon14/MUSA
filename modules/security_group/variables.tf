variable "name" {
  description = "Name of the security group"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the security group will be created"
  type        = string
}

variable "security_group_name" {
  description = "The name of the security group"
  type        = string
  default     = "dev-app-SG"
}

variable "tags" {
  description = "Tags to apply to the security group"
  type        = map(string)
  default     = {
    Name        = "dev-app-SG"
    Environment = "dev"
  }
}
