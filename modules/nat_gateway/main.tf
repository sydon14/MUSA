# Elastic IPs for NAT Gateways in DMZ Subnets
resource "aws_eip" "nat" {
  for_each = {
    dmz_ue1a = var.dmz_subnet_ue1a_id
    dmz_ue1b = var.dmz_subnet_ue1b_id
  }
  domain = "vpc"
  tags = {
    Name = "${var.environment}-nat-eip-${each.key}"
  }
}

# NAT Gateways for DMZ Subnets
resource "aws_nat_gateway" "nat" {
  for_each = {
    dmz_ue1a = var.dmz_subnet_ue1a_id
    dmz_ue1b = var.dmz_subnet_ue1b_id
  }

  allocation_id = aws_eip.nat[each.key].id
  subnet_id     = each.value

  tags = {
    Name = "${var.environment}-nat-gateway-${each.key}"
  }
}
