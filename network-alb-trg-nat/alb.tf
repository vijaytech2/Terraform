resource "aws_lb" "my_alb" {
  name = "test-alb"
  load_balancer_type = "application"
  internal = false
  security_groups = [aws_security_group.alb_sg.id]
  subnets = [aws_subnet.public-subnet.id, aws_subnet.public-subnet-1b.id]
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