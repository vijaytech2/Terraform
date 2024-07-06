resource "aws_lb_target_group" "target_grp" {
  name = "mytargetgroup"
  port = "80"
  protocol = "HTTP"
  vpc_id = aws_vpc.production-vpc.id
}