# Output the AWS region
output "aws_region" {
  description = "The AWS region used for deployment"
  value       = var.aws_region
}

# Output the S3 bucket name for Terraform state
output "s3_bucket_name" {
  description = "The name of the S3 bucket used for Terraform state"
  value       = aws_s3_bucket.state_bucket.bucket
}

# Output the DynamoDB table name for Terraform state locking
output "dynamodb_table_name" {
  description = "The name of the DynamoDB table used for Terraform state locking"
  value       = aws_dynamodb_table.state_lock_table.name
}

# Output the ID of the created VPC
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.test.id
}

# Output the Internet Gateway ID
output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.igw.id
}

# Output the NAT Gateway ID
output "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = aws_nat_gateway.nat.id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = [
    aws_subnet.dmz_subnet_ue1a.id,
    aws_subnet.mgn_subnet_ue1a.id,
    aws_subnet.dmz_subnet_ue1b.id   
  ]
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = [
    aws_subnet.app_subnet_ue1a.id,
    aws_subnet.app_subnet_ue1b.id,  
    aws_subnet.data_subnet_ue1a.id,
    aws_subnet.data_subnet_ue1b.id,
    aws_subnet.subnet_ue1a_tgwa.id, 
    aws_subnet.subnet_ue1b_tgwa.id  
  ]
}


output "tgw_attachment_id" {
  description = "Transit Gateway Attachment ID from the module"
  value       = module.tgw_attachment.tgw_attachment_id
}

output "tgw_attachment_state" {
  description = "Transit Gateway Attachment State from the module"
  value       = module.tgw_attachment.tgw_attachment_state
}

output "security_group_id" {
  value = module.security_group.app_sg_id
}

output "mgn_endpoint_id" {
  value = module.vpc_endpoints.mgn_endpoint_id
}
