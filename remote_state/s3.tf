resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = var.bucket_name
  acl    = "private"

  tags = {
    Name        = "Terraform state bucket for ${var.bucket_environment} environment"
    environment = var.bucket_environment
  }
}
