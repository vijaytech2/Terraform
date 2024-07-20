# module "ec2_instance" {
#     source = "./modules/EC2"
#     ami          = var.ami
#     instace_type = var.instace_type
#     instace_type = lookup(instance_type, terraform.workspace, t2.nano)
# }
module "ebs_volume" {
  source = "./modules/EC2"
  availability_zone = var.availability_zone
  # volume-1-size     = var.volume-1-size
  volume-1-size     = lookup(var.volume-1-size, terraform.workspace, 10)
  vol_type         = var.vol_type
  
  
}

# output "public_ip" {
#   value = module.ec2_instance.ec2eip
# }
output "ebs_volume_id" {
  value = module.ebs_volume.volume-id
}