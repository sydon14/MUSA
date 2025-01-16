# Environment for tagging
variable "environment" {
  description = "The environment for the NAT Gateway"
  type        = string
}

# Default VPC CIDR block
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.103.2.0/23"  
}

# DMZ Subnet IDs for NAT Gateways
variable "dmz_subnet_ue1a_id" {
  description = "DMZ Subnet ID in Availability Zone UE1A"
  type        = string
  default     = "subnet-062bc0140523ea7be" 
}

variable "dmz_subnet_ue1b_id" {
  description = "DMZ Subnet ID in Availability Zone UE1B"
  type        = string
  default     = "subnet-0e7f7fc2e972ded13" 
}
