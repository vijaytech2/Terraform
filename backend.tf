# Terraform state will be stored in S3
terraform {
  backend "s3" {
    bucket = "vijay-terra-state-bkt"
    key    = "terraform.tfstate"
    region = "us-east-1"
	dynamodb_table = "my_dynamotable"
  }
}