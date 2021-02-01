variable "environment" {
  description = "The current running environment"
  type = string
}

variable "code_bucket" {
  description = "S3 Bucket where the Lambda .zip is stored"
  type = string
}

variable "code_key" {
  description = "Key for the Lambda .zip"
  type = string
}

variable "handler" {
  description = "The Lambda handler method"
  type = string
}

variable "runtime" {
  description = "Runtime for the Lambda function"
  type = string
}