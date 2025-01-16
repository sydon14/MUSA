terraform {
  backend "s3" {
    bucket         = "misusa-shared-terraform-state-bucket"
    key            = "dev/subnets/terraform.tfstate"
    profile        = "Misusa"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}