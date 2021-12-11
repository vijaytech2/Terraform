resource "aws_instance" "my-terraform-ec2" {
  ami = "${var.linuxami}"
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
}
