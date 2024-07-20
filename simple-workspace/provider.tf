terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.59.0"
    }
  }
}
# provider "aws" {
#   alias = "useast"
#   region = var.NorthVeriginia
#   profile = "devops_cicd"
  
# }
provider "aws" {
  region = var.mumbai
  profile = "devops_cicd"
  
}