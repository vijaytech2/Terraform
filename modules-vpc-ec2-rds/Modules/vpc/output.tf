output "subnet_ids" {
    value = [aws_subnet.subnet-1a.id, aws_subnet.subnet-1b.id]
  
}

output "sg" {
    value = [aws_security_group.dev_sg.id, aws_security_group.dev_sg1.id]
  
}