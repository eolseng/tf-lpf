output "prod_code_bucket_name" {
  description = "The name of the S3 Bucket for storing Production code"
  value = aws_s3_bucket.prod_code_bucket.bucket
}
output "dev_code_bucket_name" {
  description = "The name of the S3 Bucket for storing Development code"
  value = aws_s3_bucket.dev_code_bucket.bucket
}

output "prod_code_bucket_arn" {
  description = "ARN identifying the S3 Bucket for storing Production code"
  value = aws_s3_bucket.prod_code_bucket.arn
}

output "dev_code_bucket_arn" {
  description = "ARN identifying the S3 Bucket for storing Development code"
  value = aws_s3_bucket.dev_code_bucket.arn
}