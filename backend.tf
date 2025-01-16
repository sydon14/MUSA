terraform {
  backend "s3" {
    bucket         = "misusa-shared-terraform-state-bucket"
    key            = "dev/terraform.tfstate"
    profile        = "Misusa"
    region         = "us-east-1"  # Directly specify the region here
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}
