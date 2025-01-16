output "ec2_endpoint_id" {
  description = "The VPC endpoint ID for EC2"
  value       = aws_vpc_endpoint.ec2.id
}

output "ec2messages_endpoint_id" {
  description = "The VPC endpoint ID for EC2 messages"
  value       = aws_vpc_endpoint.ec2messages.id
}

output "mgn_endpoint_id" {
  description = "The VPC endpoint ID for MGN"
  value       = aws_vpc_endpoint.mgn.id
}

output "s3_endpoint_id" {
  description = "The VPC endpoint ID for S3"
  value       = aws_vpc_endpoint.s3.id
}

output "ssm_endpoint_id" {
  description = "The VPC endpoint ID for SSM"
  value       = aws_vpc_endpoint.ssm.id
}

output "ssmmessages_endpoint_id" {
  description = "The VPC endpoint ID for SSM messages"
  value       = aws_vpc_endpoint.ssmmessages.id
}
