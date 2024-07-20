variable "mumbai" {
    default = "ap-south-1"
  
}

# variable "ami" {
#   description = "deploying the application with dynamic ami based on the environment"
#   # default = "ami-0a0e5d9c7acc336f1"
  
# }

# variable "instace_type" {
#   description = ""
#   # default = "t2.micro"
# }
variable "volume-1-size" {
  type = number
  description = "volume size"
}
variable "availability_zone" {
  description = "choose the az"
}
variable "vol_type" {
  description = "volume type"
}
# variable "tags" {
#   description = "tags required"
# }

# variable "key_paire" {
#   description = "dynamic value"
#     # default = "ap-south-key"
  
# }
