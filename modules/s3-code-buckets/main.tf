# Lambda Function Code Artifacts bucket
resource "aws_s3_bucket" "prod_code_bucket" {
  bucket = "${var.environment}-prod-pa-code"
  acl = "private"

  versioning {
    enabled = true
  }

  tags = {
    Terraform = true
    Environment = var.environment
  }
}

resource "aws_s3_bucket" "dev_code_bucket" {
  bucket = "${var.environment}-dev-pa-code"
  acl = "private"

  versioning {
    enabled = true
  }
  lifecycle_rule {
    # Expire non-current versions in development bucket after 30 days
    enabled = true
    noncurrent_version_expiration {
      days = 30
    }
  }
  tags = {
    Terraform = true
    Environment = var.environment
  }
}