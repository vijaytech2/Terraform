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
  vpc_security_group_ids = [aws_security_group.alb_sg.id]
  
  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "Launch_template"
    }
  }  

  # user_data = file("${path.module}/userdata.tpl")
    user_data = base64encode(<<-EOF
    
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y httpd
    sudo systemctl start httpd
    sudo systemctl enable httpd
    cd /var/www/html
    echo "Hello Vijay !!, I am just coming from $(hostname -f)" > index.html
    echo $(curl http://169.254.169.254/latest/meta-data/local-ipv4) >> index.html
    EC2_AVAIL_ZONE=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)
    
  EOF
  )
}