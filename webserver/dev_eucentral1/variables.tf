variable "aws_region" {
  type = string
  default = "us-east-1"
  description = "The default AWS region to deploy the webservice"
}

variable "service_name" {
  type = string
  description = "The name of the service to be deployed"
}

variable "service_environment" {
  type = string
  description = "The environment where the service will be deployed"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
  description = "The EC2 instance type"
}

variable "email_to_notify" {
  type = string
  description = "The email to send CloudWatch alerts"
}
