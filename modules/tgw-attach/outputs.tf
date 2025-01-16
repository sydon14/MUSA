output "tgw_attachment_id" {
  description = "The ID of the Transit Gateway VPC attachment"
  value       = aws_ec2_transit_gateway_vpc_attachment.this.id
}

# output "tgw_attachment_state" {
#   description = "The state of the Transit Gateway VPC attachment"
#   value       = aws_ec2_transit_gateway_vpc_attachment.this.attachment_state
# }

output "associated_subnets" {
  description = "The subnets associated with the Transit Gateway VPC attachment"
  value       = aws_ec2_transit_gateway_vpc_attachment.this.subnet_ids
}
