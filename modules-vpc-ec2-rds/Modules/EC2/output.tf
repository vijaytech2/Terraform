output "ec2instance" {
  value = aws_instance.ec2mod[*]
}