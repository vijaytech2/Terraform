resource "aws_launch_template" "mytemplate" {
  name = "mytemplate"

  block_device_mappings {
    device_name = "/dev/sdf"

    ebs {
      volume_size = 20
    }
  }
  image_id = "ami-041feb57c611358bd"
  instance_type = var.INSTANCE_TYPE
  key_name = "terraform_keypair"
  vpc_security_group_ids = ["aws_security_group.publicEC2Security.id", "aws_security_group.albSecurityGroup.id"]
  
  network_interfaces {
    associate_public_ip_address = true
  }
  

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "Launch_template"
    }
  }  

  user_data = file("${path.module}/userdata.tpl")
}