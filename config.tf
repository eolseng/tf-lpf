# Configure provider version
terraform {
  backend "s3" {
    # Backend is configured by Circle-CI based on branch and files in './setup/backends/{environment}.tf'
  }
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
