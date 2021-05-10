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
  description = "The EC2 instance type"
}
