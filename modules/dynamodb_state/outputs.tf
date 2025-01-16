# Output the name of the DynamoDB table
output "state_lock_table_name" {
  description = "The name of the DynamoDB table used for state locking."
  value       = aws_dynamodb_table.state_lock_table.name
}

# Output the ARN of the DynamoDB table
output "state_lock_table_arn" {
  description = "The ARN of the DynamoDB table used for state locking."
  value       = aws_dynamodb_table.state_lock_table.arn
}

# Output the billing mode of the DynamoDB table
output "state_lock_table_billing_mode" {
  description = "The billing mode of the DynamoDB table."
  value       = aws_dynamodb_table.state_lock_table.billing_mode
}

# Output the hash key of the DynamoDB table
output "state_lock_table_hash_key" {
  description = "The hash key of the DynamoDB table."
  value       = aws_dynamodb_table.state_lock_table.hash_key
}