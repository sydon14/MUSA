# Outputs for Route Table IDs
output "public_route_table_dmz_a_id" {
  description = "The ID of the public route table for DMZ-a"
  value       = aws_route_table.public_route_table_dmz_a.id
}

output "public_route_table_dmz_b_id" {
  description = "The ID of the public route table for DMZ-b"
  value       = aws_route_table.public_route_table_dmz_b.id
}

output "private_route_table_az_a_id" {
  description = "The ID of the private route table for AZ A"
  value       = aws_route_table.private_route_table_az_a.id
}

output "private_route_table_az_b_id" {
  description = "The ID of the private route table for AZ B"
  value       = aws_route_table.private_route_table_az_b.id
}

# Outputs for MGN Route Table and Routes
output "mgn_route_table_id" {
  description = "The ID of the MGN route table"
  value       = aws_route_table.mgn_route_table.id
}

# Outputs for MGN Routes (via Transit Gateway or NAT Gateway)
output "mgn_routes" {
  description = "Routes for the MGN subnet"
  value = {
    tgw_10    = aws_route.mgn_route_tgw_10.transit_gateway_id
    tgw_192   = aws_route.mgn_route_tgw_192.transit_gateway_id
    tgw_172   = aws_route.mgn_route_tgw_172.transit_gateway_id
    nat_route = aws_route.mgn_route_nat.nat_gateway_id
  }
}
