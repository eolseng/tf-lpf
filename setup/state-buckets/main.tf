# Configure provider version and backend
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket = "production-pa-mvp-state-buckets-tf-state"
    key = "state/terraform.tfstate"
    region = "eu-north-1"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-north-1"
}

# State bucket for this project
resource "aws_s3_bucket" "state_bucket" {
  bucket = "production-pa-mvp-state-buckets-tf-state"
  acl = "private"

  versioning {
    enabled = true
  }

  tags = {
    Terraform = true
    Environment = "production"
  }
}

# DEVELOPMENT STATE BUCKET
resource "aws_s3_bucket" "development_state_bucket" {
  bucket = "development-pa-mvp-tf-state"
  acl = "private"

  versioning {
    enabled = true
  }

  tags = {
    Terraform = true
    Environment = "development"
  }
}

# STAGING STATE BUCKET
resource "aws_s3_bucket" "staging_state_bucket" {
  bucket = "staging-pa-mvp-tf-state"
  acl = "private"

  versioning {
    enabled = true
  }

  tags = {
    Terraform = true
    Environment = "staging"
  }
}

# DEVELOPMENT STATE BUCKET
resource "aws_s3_bucket" "production_state_bucket" {
  bucket = "production-pa-mvp-tf-state"
  acl = "private"

  versioning {
    enabled = true
  }

  tags = {
    Terraform = true
    Environment = "production"
  }
}