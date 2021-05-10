variable "aws_region" {
  type = string
  default = "us-east-1"
  description = "The AWS region to create the bucket and the Dynamo DB table"
}

variable "bucket_environment" {
  type = string
  description = "Which service environment the bucket represents"
}

variable "bucket_name" {
  type = string
  description = "The name of the bucket for storing the Terraform state file"
}
