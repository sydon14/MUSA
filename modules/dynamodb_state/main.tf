# Shared Infrastructure: DynamoDB Table for Locking
resource "aws_dynamodb_table" "state_lock_table" {
  name     = "terraform-lock-table"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  billing_mode = "PAY_PER_REQUEST"

  tags = {
    Name        = "Terraform Lock Table"
    Environment = var.environment
  }
}
