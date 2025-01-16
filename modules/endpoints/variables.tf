variable "vpc_id" {
  description = "VPC ID where the endpoints will be created"
  type        = string
  default     = "vpc-0d1c01b40e6a323d1"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
  default     = [
    "subnet-08ecc209b9e418f06",  # AZ A
    "subnet-03d6d0847b5521bb1",  # AZ A
    "subnet-035e76486c8e056b2",  # AZ A
    "subnet-025acc8be2dbc8426",  # AZ B
    "subnet-07c4d96b118b4ac56",  # AZ B
    "subnet-0707cbc25f6e683aa"   # AZ B
  ]
}

variable "private_route_table_ids" {
  description = "List of route table IDs for private subnets"
  type        = list(string)
  default     = [
    "rtb-03278dfa63582deca",  # AZ A
    "rtb-0d1c7906a970634af"   # AZ B
  ]
}

variable "security_group_id" {
  description = "List of security group IDs for private endpoints"
  type        = list(string)
  default     = [
    "sg-08eb208690816ffa4",  # Dev SG
    "sg-09c77b9b273bb46a0"   # MGN SG
  ]
}

variable "mgn_security_group_id" {
  description = "Security group for MGN"
  type        = string
  default     = "sg-09c77b9b273bb46a0"  # MGN Security Group
}

variable "mgn_subnet_id" {
  description = "Subnet ID dedicated for MGN interface endpoint"
  type        = string
  default     = "subnet-08707a3fddb8cc3c5"  # MGN Subnet
}
