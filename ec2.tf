provider "aws" {
   region = "us-east-1"  
}

resource "aws_instance" "my-terraform-ec2" {
  ami = "${var.ami}"
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
  
}


