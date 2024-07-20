# variable "NorthVeriginia" {
#     default = "us-east-1"
  
# }
variable "mumbai" {
    default = "ap-south-1"
  
}

variable "ami" {
  default = ""
}

variable "instace_type" {
  type = map(string)
  default = {
    "dev" = "t2.micro"
    "prod" = "t2.medium"
    "sit"  = "t2.large"
  }
}
variable "volume-1-size" {
  description = "size"
  type = map(string)
  default = {
    "dev" = "1"
    "prod" = "5"
    "sit"  = "2"
  }
}
variable "availability_zone" {
  description = "dhdhd"
}
variable "vol_type" {
  description = "volume type"
}

# variable "key_paire" {
#   default = ""
# }
# variable "dev_vpc" {
#   default = ""
# }
# variable "az1" {
#   default = ""
# }
# variable "az2" {
#   default = ""
# }

# variable "subnet-1a" {
#     default = ""
  
# }

# variable "subnet-1b" {
#     default = ""
  
# }