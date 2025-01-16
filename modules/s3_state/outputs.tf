# Output the S3 bucket name
output "state_bucket_name" {
  description = "The name of the S3 bucket for Terraform state."
  value       = aws_s3_bucket.state_bucket.bucket
}

# Output the ARN of the S3 bucket
output "state_bucket_arn" {
  description = "The ARN of the S3 bucket for Terraform state."
  value       = aws_s3_bucket.state_bucket.arn
}

# Output the encryption algorithm for the S3 bucket
output "state_bucket_encryption" {
  description = "The server-side encryption configuration of the S3 bucket."
  value = [for rule in aws_s3_bucket_server_side_encryption_configuration.state_bucket_encryption.rule : rule.apply_server_side_encryption_by_default[0].sse_algorithm][0]
}

# Output the versioning status of the S3 bucket
output "state_bucket_versioning_status" {
  description = "The versioning status of the S3 bucket."
  value       = aws_s3_bucket_versioning.state_bucket_versioning.versioning_configuration[0].status
}

