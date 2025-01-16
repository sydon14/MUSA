# Define the CIDR block for the VPC with a default value
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.103.2.0/23"  
}

# Define the environment variable
variable "environment" {
  description = "The environment for the VPC"
  type        = string
  default     = "dev"  
}

# Define the region variable
variable "region" {
  description = "The AWS region for the VPC"
  type        = string
  default     = "us-east-1"  
}
