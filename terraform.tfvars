aws_region             = "us-east-1"
aws_profile            = "Misusa"
environment           = "dev01"
tags = {
  Project = "Migration"
  Owner   = "Admin"
}

# VPC and Subnet CIDR Blocks
vpc_cidr              = "10.103.2.0/23"
dmz_subnet_ue1a_cidr  = "10.103.2.64/27"
dmz_subnet_ue1b_cidr  = "10.103.2.96/27"
mgn_subnet_cidr       = "10.103.2.32/27"
app_subnet_ue1a_cidr  = "10.103.2.128/26"
app_subnet_ue1b_cidr  = "10.103.2.192/26"
data_subnet_ue1a_cidr = "10.103.3.0/26"
data_subnet_ue1b_cidr = "10.103.3.64/26"
tgw_subnet_ue1a_cidr  = "10.103.2.0/28"   
tgw_subnet_ue1b_cidr  = "10.103.2.16/28"  

private_subnet_ids = [
  "subnet-08ecc209b9e418f06",
  "subnet-03d6d0847b5521bb1",
  "subnet-0707cbc25f6e683aa",
  "subnet-07c4d96b118b4ac56",
  "subnet-025acc8be2dbc8426",
  "subnet-035e76486c8e056b2"
]

public_subnet_ids = [
  "subnet-08707a3fddb8cc3c5",
  "subnet-062bc0140523ea7be",
  "subnet-0e7f7fc2e972ded13"
  
]


# Transit Gateway ID 
transit_gateway_id   = "tgw-066fb7df2a08bdb2a"  

# NAT Gateway ID 
nat_gateway_id   = "nat-0a705ef9dde5b34ec" 

