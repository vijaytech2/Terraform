
# resource "aws_instance" "myinstance" {
#     ami                 = var.ami
#     instance_type       = var.instace_type
     

  
# }
resource "aws_ebs_volume" "vol-1" {
  availability_zone = var.availability_zone
  size              = var.volume-1-size
  type              = var.vol_type
  tags              = var.tags

}

# output "ec2eip" {
#   value = aws_instance.myinstance.public_ip
# }
output "volume-id" {
  value = aws_ebs_volume.vol-1.id
}