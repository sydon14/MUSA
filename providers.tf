terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Or the version you're using
    }
  }
}
provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}