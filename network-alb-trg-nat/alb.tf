resource "aws_alb" "my_alb" {
  name = "test-alb"
  load_balancer_type = "application"
  internal = false
  security_groups = ["aws_security_group.publicEC2Security.id", "aws_security_group.albSecurityGroup.id"]
  subnets = ["var.aws_subnet.public-subnet.id", "var.aws_subnet.public-subnet-1b.id"]
  tags = {
    Environment = "production"
  }
}  

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_alb.my_alb.arn
  port = 80
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.target_grp.arn
  }
}