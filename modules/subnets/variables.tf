variable "environment" {
  description = "The environment for the VPC"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID"
  type        = string
}

# DMZ Subnet Variables
variable "dmz_subnet_ue1a_cidr" {
  description = "CIDR block for the DMZ Subnet (UE1A)"
  type        = string
  default     = "10.103.2.64/27"
}

# DMZ Subnet Variables
variable "dmz_subnet_ue1b_cidr" {
  description = "CIDR block for the DMZ Subnet (UE1B)"
  type        = string
  default     = "10.103.2.96/27"
}

# MGN Subnet Variable
variable "mgn_subnet_cidr" {
  description = "CIDR block for the MGN Subnet"
  type        = string
  default     = "10.103.2.32/27"
}

# App Subnet Variables
variable "app_subnet_ue1a_cidr" {
  description = "CIDR block for the App Subnet (UE1A)"
  type        = string
  default     = "10.103.2.128/26"
}

variable "app_subnet_ue1b_cidr" {
  description = "CIDR block for the App Subnet (UE1B)"
  type        = string
  default     = "10.103.2.192/26"
}

# Data Subnet Variables
variable "data_subnet_ue1a_cidr" {
  description = "CIDR block for the Data Subnet (UE1A)"
  type        = string
  default     = "10.103.3.0/26"
}

variable "data_subnet_ue1b_cidr" {
  description = "CIDR block for the Data Subnet (UE1B)"
  type        = string
  default     = "10.103.3.64/26"  
}

# TGW Subnet Variables
variable "tgw_subnet_ue1a_cidr" {
  description = "CIDR block for the TGW Subnet (UE1A)"
  type        = string
  default     = "10.103.2.0/28"
}

variable "tgw_subnet_ue1b_cidr" {
  description = "CIDR block for the TGW Subnet (UE1B)"
  type        = string
  default     = "10.103.2.16/28"
}
