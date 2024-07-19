resource "aws_instance" "ec2mod" {
    ami                 = var.ami
    instance_type       = var.instace_type
    key_name            = var.key_paire
     

  
}