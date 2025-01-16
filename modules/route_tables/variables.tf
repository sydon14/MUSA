# Environment for Tagging
variable "environment" {
  description = "The environment (e.g., dev, prod)"
  type        = string
  default     = "dev"
}

# Subnet IDs
variable "dmz_subnet_ue1a_id" {
  description = "Subnet ID for DMZ Subnet in UE1A"
  type        = string
  default     = "subnet-062bc0140523ea7be"
}

variable "dmz_subnet_ue1b_id" {
  description = "Subnet ID for DMZ Subnet in UE1B"
  type        = string
  default     = "subnet-0e7f7fc2e972ded13"
}

variable "private_subnet_az_a_ids" {
  description = "List of private subnet IDs for AZ A"
  type        = list(string)
  default     = [
    "subnet-08ecc209b9e418f06",
    "subnet-03d6d0847b5521bb1",
    "subnet-035e76486c8e056b2"
  ]
}

variable "private_subnet_az_b_ids" {
  description = "List of private subnet IDs for AZ B"
  type        = list(string)
  default     = [
    "subnet-025acc8be2dbc8426",
    "subnet-07c4d96b118b4ac56",
    "subnet-0707cbc25f6e683aa"
  ]
}

variable "nat_gateway_ids" {
  description = "Map of NAT Gateway IDs for DMZ Subnets and MGN Subnet (if needed)"
  type        = map(string)
  default     = {
    dmz_ue1a = "nat-0c4a8ca9eb94fafce"  
    dmz_ue1b = "nat-0cf632ed22b70ccdd"  
  }
}

# Transit Gateway ID
variable "transit_gateway_id" {
  description = "The ID of the Transit Gateway"
  type        = string
  default     = "tgw-066fb7df2a08bdb2a"
}

# Internet Gateway ID (for DMZ subnets)
variable "internet_gateway_id" {
  description = "The ID of the Internet Gateway for DMZ Subnets"
  type        = string
  default     = "igw-0f453d42b04d1c00e"
}

# MGN Subnet ID
variable "mgn_subnet_id" {
  description = "The subnet ID for the MGN subnet"
  type        = string
  default     = "subnet-08707a3fddb8cc3c5"
}
