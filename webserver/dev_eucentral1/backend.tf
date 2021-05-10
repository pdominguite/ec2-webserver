terraform {
  backend "s3" {
    bucket          = "your-unique-bucket-name"
    key             = "my/custom/folder/for/the/state/file"
    region          = "us-east-1"
    encrypt         = true
    dynamodb_table  = "terraform-lock"
  }
}
