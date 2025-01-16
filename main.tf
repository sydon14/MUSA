# Shared Infrastructure: S3 Bucket for State Files
module "state_bucket" {
  source      = "./modules/s3_state" 
  environment = var.environment
}

# Shared Infrastructure: DynamoDB Table for Locking
module "state_lock_table" {
  source      = "./modules/dynamodb_state" 
  environment = var.environment
}

# VPC Creation
module "vpc" {
  source      = "./modules/vpc" 
  vpc_cidr    = var.vpc_cidr
  environment = var.environment
  region      = var.region
}

# Internet Gateway
module "internet_gateway" {
  source      = "./modules/igw"
  vpc_id      = module.vpc.vpc_id
  environment = var.environment
}

# NAT Gateway
module "nat_gateway" {
  source          = "./modules/nat_gateway"
  public_subnet_id = module.subnets.dmz_subnet_ue1a_id # Example: Use DMZ subnet for NAT
  environment      = var.environment
}

# Subnets
module "subnets" {
  source                       = "./modules/subnets"
  vpc_id                       = module.vpc.vpc_id
  dmz_subnet_ue1a_cidr         = var.dmz_subnet_ue1a_cidr
  dmz_subnet_ue1b_cidr         = var.dmz_subnet_ue1b_cidr
  mgn_subnet_cidr              = var.mgn_subnet_cidr
  app_subnet_ue1a_cidr         = var.app_subnet_ue1a_cidr
  app_subnet_ue1b_cidr         = var.app_subnet_ue1b_cidr
  data_subnet_ue1a_cidr        = var.data_subnet_ue1a_cidr
  data_subnet_ue1b_cidr        = var.data_subnet_ue1b_cidr
  transit_gateway_ue1a_cidr    = var.transit_gateway_ue1a_cidr
  transit_gateway_ue1b_cidr    = var.transit_gateway_ue1b_cidr
  environment                  = var.environment
}

# Route Tables
module "route_table" {
  source            = "./modules/route_tables"
  vpc_id            = module.vpc.vpc_id
  nat_gateway_id    = module.nat_gateway.nat_gateway_id
  private_subnet_ids = module.subnets.private_subnet_ids
  public_subnet_ids  = module.subnets.public_subnet_ids
  environment        = var.environment
}

# Route Table Associations
module "route_table_associations" {
  source                       = "./modules/route_tables"
  public_route_table_id        = module.route_table.public_route_table_id
  private_route_table_id       = module.route_table.private_route_table_id
  dmz_subnet_ue1a_id           = module.subnets.dmz_subnet_ue1a_id
  dmz_subnet_ue1b_id           = module.subnets.dmz_subnet_ue1b_id
  mgn_subnet_id                = module.subnets.mgn_subnet_id
  app_subnet_ue1a_id           = module.subnets.app_subnet_ue1a_id
  app_subnet_ue1b_id           = module.subnets.app_subnet_ue1b_id
  data_subnet_ue1a_id          = module.subnets.data_subnet_ue1a_id
  data_subnet_ue1b_id          = module.subnets.data_subnet_ue1b_id
  transit_gateway_subnet_ue1a_id = module.subnets.transit_gateway_ue1a_id
  transit_gateway_subnet_ue1b_id = module.subnets.transit_gateway_ue1b_id
}

# Transit Gateway VPC Attachment
module "transit_gateway_attachment" {
  source         = "./modules/tgw-attach"
  transit_gateway_id = var.tgw_id
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.subnets.transit_gateway_subnet_ids
  environment     = var.environment
}

module "security_group" {
  source = "./modules/security_group"

  name   = "app-security-group"
  vpc_id = var.vpc_id
  tags   = var.tags
}

module "vpc_endpoints" {
  source = "./modules/vpc_endpoints"

  vpc_id                 = var.vpc_id
  region                 = var.region
  public_subnet_ids      = var.public_subnet_ids
  private_subnet_ids     = var.private_subnet_ids
  private_route_table_ids = var.private_route_table_ids
  tags                   = var.tags
}
