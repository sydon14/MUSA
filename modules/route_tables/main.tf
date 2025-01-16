# Data block to reference the existing VPC
data "aws_vpc" "test" {
  id = "vpc-0d1c01b40e6a323d1"
}

# Public Route Tables for DMZ Subnets
resource "aws_route_table" "public_route_table_dmz_a" {
  vpc_id = data.aws_vpc.test.id
  tags = {
    Name = "${var.environment}-public-route-table-dmz-a"
  }
}

resource "aws_route_table" "public_route_table_dmz_b" {
  vpc_id = data.aws_vpc.test.id
  tags = {
    Name = "${var.environment}-public-route-table-dmz-b"
  }
}

# Route for Internet Traffic via Internet Gateway for DMZ-a
resource "aws_route" "nat_route_dmz_a" {
  route_table_id         = aws_route_table.public_route_table_dmz_a.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.internet_gateway_id
}

# Route for Internet Traffic via Internet Gateway for DMZ-b
resource "aws_route" "nat_route_dmz_b" {
  route_table_id         = aws_route_table.public_route_table_dmz_b.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.internet_gateway_id
}

# Private Route Tables for Private Subnets in each AZ
resource "aws_route_table" "private_route_table_az_a" {
  vpc_id = data.aws_vpc.test.id
  tags = {
    Name = "${var.environment}-private-route-table-az-a"
  }
}

resource "aws_route_table" "private_route_table_az_b" {
  vpc_id = data.aws_vpc.test.id
  tags = {
    Name = "${var.environment}-private-route-table-az-b"
  }
}

# Route for Private Subnets in AZ A via DMZ-a NAT Gateway
resource "aws_route" "private_nat_route_az_a" {
  route_table_id         = aws_route_table.private_route_table_az_a.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = var.nat_gateway_ids["dmz_ue1a"]
}

# Route for Private Subnets in AZ B via DMZ-b NAT Gateway
resource "aws_route" "private_nat_route_az_b" {
  route_table_id         = aws_route_table.private_route_table_az_b.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = var.nat_gateway_ids["dmz_ue1b"]
}

# Private subnets in AZ A to route traffic to TGW
resource "aws_route" "private_tgw_routes_az_a" {
  for_each = toset(["10.0.0.0/8", "192.168.0.0/16", "172.16.0.0/12"]) # List of CIDR blocks
  route_table_id         = aws_route_table.private_route_table_az_a.id
  destination_cidr_block = each.value
  transit_gateway_id     = var.transit_gateway_id
}

# Private subnets in AZ B to route traffic to TGW
resource "aws_route" "private_tgw_routes_az_b" {
  for_each = toset(["10.0.0.0/8", "192.168.0.0/16", "172.16.0.0/12"]) # List of CIDR blocks
  route_table_id         = aws_route_table.private_route_table_az_b.id
  destination_cidr_block = each.value
  transit_gateway_id     = var.transit_gateway_id
}

# Associate DMZ Subnet in UE1A with Public Route Table
resource "aws_route_table_association" "dmz_a_public_subnet" {
  subnet_id      = var.dmz_subnet_ue1a_id
  route_table_id = aws_route_table.public_route_table_dmz_a.id
}

# Associate DMZ Subnet in UE1B with Public Route Table
resource "aws_route_table_association" "dmz_b_public_subnet" {
  subnet_id      = var.dmz_subnet_ue1b_id
  route_table_id = aws_route_table.public_route_table_dmz_b.id
}

# Associate Private Subnets in UE1A with Private Route Table
resource "aws_route_table_association" "private_subnet_az_a" {
  for_each = toset(["subnet-08ecc209b9e418f06", "subnet-03d6d0847b5521bb1", "subnet-035e76486c8e056b2"])
  subnet_id      = each.value
  route_table_id = aws_route_table.private_route_table_az_a.id
}

# Associate Private Subnets in UE1B with Private Route Table
resource "aws_route_table_association" "private_subnet_az_b" {
  for_each = toset(["subnet-025acc8be2dbc8426", "subnet-07c4d96b118b4ac56", "subnet-0707cbc25f6e683aa"])
  subnet_id      = each.value
  route_table_id = aws_route_table.private_route_table_az_b.id
}

# MGN Route Table for the MGN Subnet
resource "aws_route_table" "mgn_route_table" {
  vpc_id = data.aws_vpc.test.id
  tags = {
    Name = "${var.environment}-mgn-route-table"
  }
}

# Routes for the MGN Subnet
# Route to TGW for 10.x.x.x traffic
resource "aws_route" "mgn_route_tgw_10" {
  route_table_id         = aws_route_table.mgn_route_table.id
  destination_cidr_block = "10.0.0.0/8"
  transit_gateway_id     = var.transit_gateway_id
}

# Route to TGW for 192.x.x.x traffic
resource "aws_route" "mgn_route_tgw_192" {
  route_table_id         = aws_route_table.mgn_route_table.id
  destination_cidr_block = "192.168.0.0/16"
  transit_gateway_id     = var.transit_gateway_id
}

# Route to TGW for 172.x.x.x traffic
resource "aws_route" "mgn_route_tgw_172" {
  route_table_id         = aws_route_table.mgn_route_table.id
  destination_cidr_block = "172.16.0.0/12"
  transit_gateway_id     = var.transit_gateway_id
}

# Route to NAT Gateway for internet traffic
resource "aws_route" "mgn_route_nat" {
  route_table_id         = aws_route_table.mgn_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = var.nat_gateway_ids["dmz_ue1a"] # Update NAT Gateway ID based on your architecture
}

# Associate the MGN Subnet with the MGN Route Table
resource "aws_route_table_association" "mgn_subnet_association" {
  subnet_id      = var.mgn_subnet_id
  route_table_id = aws_route_table.mgn_route_table.id
}
