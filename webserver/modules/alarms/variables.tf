variable "email_to_notify" {
  type = string
  description = "The email to receive alarm notifications"
}

variable "service_name" {
  type = string
  description = "The name of the service to be deployed"
}

variable "service_environment" {
  type = string
  description = "The environment where the service will be deployed"
}
