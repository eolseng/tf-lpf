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