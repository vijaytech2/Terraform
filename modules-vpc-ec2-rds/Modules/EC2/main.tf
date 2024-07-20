module "vpc" {
  source = "../vpc"
}
# resource "aws_instance" "ec2mod" {
#     ami                 = var.ami
#     instance_type       = var.instace_type
#     key_name            = var.key_paire
     

  
# }
resource "aws_launch_template" "default_lt" {
    name = "mytemplate"

  block_device_mappings {
    device_name = "/dev/sdf"

    ebs {
      volume_size = 20
    }
  }
  image_id = var.ami
  instance_type = var.instace_type
  key_name = var.key_paire
  vpc_security_group_ids = module.vpc.sg
  
  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "Launch_template"
    }
  }  

  # user_data = file("${path.module}/userdata.tpl")
    user_data = base64encode(<<-EOF
    
    #!/bin/bash
    sudo apt-get update -y
    sudo apt-get install nginx
    sudo service nginx start
    sudo service enable nginx
    cd /var/www/html
    echo "Hello Vijay !!, I am just coming from $(hostname -f)" > index.html

    
  EOF
  )
}
resource "aws_lb_target_group" "target_grp" {
  name = "mytargetgroup"
  port = "80"
  protocol = "HTTP"
  vpc_id = module.vpc.vpc_id
}
resource "aws_lb" "my_alb" {
  name = "myalb"
  load_balancer_type = "application"
  internal = false
  security_groups = module.vpc.sg
  subnets = module.vpc.subnet_ids
  tags = {
    Environment = "production"
  }
}  

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.my_alb.arn
  port = 80
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.target_grp.arn
  }
}
resource "aws_autoscaling_group" "asg_grp" {
  launch_template {
    id = aws_launch_template.default_lt.id
    
  }
  name = "terraform_asg_grp"
  target_group_arns = [aws_lb_target_group.target_grp.arn]
  health_check_grace_period = 300
  health_check_type = "EC2"
  force_delete = true
  vpc_zone_identifier = module.vpc.subnet_ids
  desired_capacity = 0
  min_size = 1
  max_size = 2
}