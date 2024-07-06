variable "ami" {
  type = map(string)
  default = {
    "us-east-1" = "ami-041feb57c611358bd"
    "eu-west-1"    = "-ami-096f43ef67d75e998"
    "eu-west-2"    = "-ami-0ffd774e02309201f"
  }
}
variable "AWS_REGION" {
  default = "us-east-1"
}
variable "INSTANCE_TYPE" {
  default = "t2.micro"
}
variable "sgPortsPublic" {
  type    = list(number)
  default = [22, 80]
}

variable "subnets" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "terraform_keypair" {
  type = any
  default = "terraform_keypair"
}

variable "vpc_cidr" {
  description = "VPC CIDR Block"
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Public Subnet CIDR"
  default = "10.0.1.0/24"
}

variable "public_subnet_cidr_1b" {
  description = "Public Subnet CIDR"
  default = "10.0.2.0/24"
}

variable "private_subnet_cidr" {
  description = "Private Subnet CIDR"
  default = "10.0.4.0/24"
}

variable "private_subnet_cidr_1b" {
  description = "Private Subnet CIDR"
  default = "10.0.5.0/24"
}

# variable "subnet_ids" {
#   type = list(string)
#   default = [ "public_subnet_cidr", "public_subnet_cidr_1b" ]
# }



