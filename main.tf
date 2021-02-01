module "s3-code-buckets" {
  # Creates the buckets for storing code artifacts
  source = "./modules/s3-code-buckets"
  environment = var.environment
}

module "hello_world_lambda" {
  source = "./modules/lambda-hello-world"
  environment = var.environment

  code_bucket = var.hello_world_code_bucket
  code_key = var.hello_world_code_key

  handler = "handler.handler"
  runtime = "nodejs12.x"
}