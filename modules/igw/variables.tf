variable "vpc_id" {
  description = "The ID of the VPC to attach the Internet Gateway to."
  type        = string
}

variable "environment" {
  description = "The environment for the IGW (e.g., dev, prod)."
  type        = string
}

