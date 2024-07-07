resource "aws_autoscaling_group" "asg_grp" {
  launch_template {
    id = aws_launch_template.mytemplate.id
    
  }
  name = "terraform_asg_grp"
  target_group_arns = [aws_lb_target_group.target_grp.arn]
  health_check_grace_period = 300
  health_check_type = "EC2"
  force_delete = true
  vpc_zone_identifier = [aws_subnet.public-subnet.id, aws_subnet.public-subnet-1b.id]
  desired_capacity = 1
  min_size = 1
  max_size = 2
}