# VPC Creation
resource "aws_vpc" "test" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name        = "vpc-network-admin-dev01-ue1"  
    Environment = var.environment
  }
}

# AWS Provider Configuration
provider "aws" {
  region = var.region  
}
