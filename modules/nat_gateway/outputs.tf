# Outputs for NAT Gateway IDs
output "nat_gateway_ids" {
  description = "The IDs of the NAT Gateways in DMZ subnets"
  value       = { for key, nat in aws_nat_gateway.nat : key => nat.id }
}

# Outputs for NAT Gateway Elastic IPs
output "nat_gateway_public_ips" {
  description = "The public IPs of the NAT Gateways in DMZ subnets"
  value       = { for key, eip in aws_eip.nat : key => eip.public_ip }
}

# Outputs for Elastic IP Allocation IDs
output "nat_gateway_allocation_ids" {
  description = "The allocation IDs of the Elastic IPs for NAT Gateways"
  value       = { for key, eip in aws_eip.nat : key => eip.id }
}
