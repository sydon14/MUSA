output "internet_gateway_id" {
  description = "The ID of the Internet Gateway."
  value       = aws_internet_gateway.igw.id
}

output "associated_vpc_id" {
  description = "The ID of the VPC associated with the Internet Gateway."
  value       = aws_internet_gateway.igw.vpc_id
}
