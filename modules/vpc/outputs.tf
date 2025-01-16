# Output the VPC ID
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.test.id
}

# Output the CIDR block of the VPC
output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.test.cidr_block
}

# Output the name of the VPC
output "vpc_name" {
  description = "The name of the VPC"
  value       = aws_vpc.test.tags["Name"]
}
