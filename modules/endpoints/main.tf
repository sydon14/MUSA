# Interface VPC Endpoint for MGN
resource "aws_vpc_endpoint" "mgn" {
  vpc_id             = var.vpc_id
  service_name       = "com.amazonaws.${var.region}.mgn"
  subnet_ids         = [var.mgn_subnet_id]  # Use only the MGN subnet
  security_group_ids = [var.mgn_security_group_id]  # Use the MGN SG
  vpc_endpoint_type  = "Interface"

  tags = {
    Name = "MGN Interface Endpoint"
  }
}


# Gateway VPC Endpoint for S3
resource "aws_vpc_endpoint" "s3" {
  vpc_endpoint_type = "Gateway"
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_id            = var.vpc_id
  route_table_ids   = var.private_route_table_ids  # Use route tables for both AZs

  tags = {
    Name = "S3 Gateway Endpoint"
  }
}

# Interface VPC Endpoint for EC2
resource "aws_vpc_endpoint" "ec2" {
  vpc_id             = var.vpc_id
  service_name       = "com.amazonaws.${var.region}.ec2"
  subnet_ids         = [var.private_subnet_ids[0], var.private_subnet_ids[3]]  # Use one subnet from each AZ
  security_group_ids = var.security_group_id
  vpc_endpoint_type  = "Interface"

  tags = {
    Name = "EC2 Interface Endpoint"
  }
}

# Interface VPC Endpoint for EC2 Messages
resource "aws_vpc_endpoint" "ec2messages" {
  vpc_id             = var.vpc_id
  service_name       = "com.amazonaws.${var.region}.ec2messages"
  subnet_ids         = [var.private_subnet_ids[1], var.private_subnet_ids[4]]  # Use specific subnets from each AZ
  security_group_ids = var.security_group_id
  vpc_endpoint_type  = "Interface"

  tags = {
    Name = "EC2 Messages Interface Endpoint"
  }
}

# Interface VPC Endpoint for SSM
resource "aws_vpc_endpoint" "ssm" {
  vpc_id             = var.vpc_id
  service_name       = "com.amazonaws.${var.region}.ssm"
  subnet_ids         = [var.private_subnet_ids[2], var.private_subnet_ids[5]]  # Use specific subnets from each AZ
  security_group_ids = var.security_group_id
  vpc_endpoint_type  = "Interface"

  tags = {
    Name = "SSM Interface Endpoint"
  }
}

# Interface VPC Endpoint for SSM Messages
resource "aws_vpc_endpoint" "ssmmessages" {
  vpc_id             = var.vpc_id
  service_name       = "com.amazonaws.${var.region}.ssmmessages"
  subnet_ids         = [var.private_subnet_ids[1], var.private_subnet_ids[4]]  # Use specific subnets from each AZ
  security_group_ids = var.security_group_id
  vpc_endpoint_type  = "Interface"

  tags = {
    Name = "SSM Messages Interface Endpoint"
  }
}

# Route Table Association for Gateway VPC Endpoint
resource "aws_route_table_association" "s3_route_table_associations" {
  for_each       = { for id in var.private_route_table_ids : id => var.private_subnet_ids[index(var.private_route_table_ids, id)] if id != "rtb-0d1c7906a970634af" }
  route_table_id = each.key
  subnet_id      = each.value
}
