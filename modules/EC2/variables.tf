variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1" 
}

variable "vpc_id" {
  description = "VPC ID for the security group"
  type        = string
  default     = "vpc-0d1c01b40e6a323d1" 
}

variable "subnet_id" {
  description = "Subnet ID for the EC2 instance"
  type        = string
  default     = "subnet-062bc0140523ea7be"
}

variable "keypair_name" {
  description = "Key pair name for SSH access"
  type        = string
  default     = "misumi_dev"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-05576a079321f21f8"
}
