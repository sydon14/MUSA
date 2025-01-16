# Public subnets 
# DMZ Subnet UE1A 
resource "aws_subnet" "dmz_subnet_ue1a" {
  vpc_id                = var.vpc_id
  cidr_block            = var.dmz_subnet_ue1a_cidr
  availability_zone     = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet-network-admin-${var.environment}-dmz01-ue1-a"
  }
}

# DMZ Subnet UE1B 
resource "aws_subnet" "dmz_subnet_ue1b" {
  vpc_id                = var.vpc_id
  cidr_block            = var.dmz_subnet_ue1b_cidr
  availability_zone     = "us-east-1b"  
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet-network-admin-${var.environment}-dmz01-ue1-b"
  }
}

resource "aws_subnet" "mgn_subnet_ue1a" {
  vpc_id                = var.vpc_id
  cidr_block            = var.mgn_subnet_cidr
  availability_zone     = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet-network-admin-${var.environment}-mgn01-ue1-a"
  }
}

# Private subnets 
resource "aws_subnet" "app_subnet_ue1a" {
  vpc_id                = var.vpc_id
  cidr_block            = var.app_subnet_ue1a_cidr
  availability_zone     = "us-east-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = "Subnet-network-admin-${var.environment}-app01-ue1-a"
  }
}

resource "aws_subnet" "app_subnet_ue1b" {
  vpc_id                = var.vpc_id
  cidr_block            = var.app_subnet_ue1b_cidr
  availability_zone     = "us-east-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "Subnet-network-admin-${var.environment}-app01-ue1-b"
  }
}

resource "aws_subnet" "data_subnet_ue1a" {
  vpc_id                = var.vpc_id
  cidr_block            = var.data_subnet_ue1a_cidr
  availability_zone     = "us-east-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = "Subnet-network-admin-${var.environment}-data01-ue1-a"
  }
}

resource "aws_subnet" "data_subnet_ue1b" {
  vpc_id                = var.vpc_id
  cidr_block            = var.data_subnet_ue1b_cidr
  availability_zone     = "us-east-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "Subnet-network-admin-${var.environment}-data01-ue1-b"
  }
}

resource "aws_subnet" "subnet_ue1a_tgwa" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.103.2.0/28"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = "Subnet-network-admin-${var.environment}-tgw01-ue1-a"
  }
}

resource "aws_subnet" "subnet_ue1b_tgwa" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.103.2.16/28"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "Subnet-network-admin-${var.environment}-tgw01-ue1-b"
  }
}
