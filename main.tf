module "s3-code-buckets" {
  # Creates the buckets for storing code artifacts
  source = "./modules/s3-code-buckets"
  environment = var.environment
}