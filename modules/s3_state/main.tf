# Shared Infrastructure: S3 Bucket for State Files
resource "aws_s3_bucket" "state_bucket" {
  bucket = "misusa-shared-terraform-state-bucket"

  tags = {
    Name        = "Shared Terraform State Bucket"
    Environment = var.environment
  }
}

# Separate resources for Server-Side Encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "state_bucket_encryption" {
  bucket = aws_s3_bucket.state_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Manage S3 Bucket Versioning Separately
resource "aws_s3_bucket_versioning" "state_bucket_versioning" {
  bucket = aws_s3_bucket.state_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}
