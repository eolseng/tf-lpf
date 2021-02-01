variable "environment" {
  description = "The current environment."
  type = string

  validation {
    condition = contains([
      "production",
      "staging",
      "development"], var.environment)
    error_message = "Must be one of: 'production', 'staging', 'development'."
  }
}

variable "aws_region" {
  description = "The AWS region to deploy infrastructure to."
  type = string
}

variable "hello_world_code_bucket" {
  description = "S3 Bucket where code artifacts is stored"
  type = string
}

variable "hello_world_code_key" {
  description = "The Key to the Hello World Lambda"
  type = string
}