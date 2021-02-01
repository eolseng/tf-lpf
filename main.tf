# Configure provider version
terraform {
  backend "s3" {}
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

# Test bucket to check promotion
resource "aws_s3_bucket" "test_bucket" {
  bucket_prefix = "${var.environment}-test-bucket-"
}