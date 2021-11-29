variable "region" {
  default = "us-east-1"
}
variable "AMILinux" {
  type = "map"
    default = {
	 us-east-1 = "ami-0b69ea66ff7391e80"
	 }
}

variable "vpc_custom" {
  default = "192.168.0.0/16"
  description = "Create a custome VPC"
}
variable "subnet-public-AZ-CIDR" {
  default = "192.168.5.0/24"
  description = "Create a public subnet"
}
variable "subnet-private-AZ-CIDR" {
  default = "192.168.6.0/24"
  description = "Create a private subnet"
}
variable "key_name" {
  default = "virginia"
  description = "allow ssh using this key"
}
 
    