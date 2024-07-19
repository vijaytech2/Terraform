resource "aws_vpc" "dev" {
  cidr_block    = var.dev_vpc
  # name = "dev_vpc"
  tags = {
    env = "dev"
  }
}

resource "aws_internet_gateway" "igw_dev" {
  vpc_id = aws_vpc.dev.id
  tags = {
    name = "igw_for_dev_vpc"
  }
}

resource "aws_subnet" "subnet-1a" {
    vpc_id = aws_vpc.dev.id
    cidr_block = var.subnet-1a
    # name = "subnet-1a"
    tags = {
      type = "pub"
    }
  
}

resource "aws_subnet" "subnet-1b" {
    vpc_id = aws_vpc.dev.id
    cidr_block = var.subnet-1b
    tags = {
      type = "prv"
    }
  
}
resource "aws_security_group" "dev_sg" {
  name   = "dev_seg_all_port"
  vpc_id = aws_vpc.dev.id
  tags = {
    env = "dev"
  }
}
resource "aws_vpc_security_group_ingress_rule" "allow-80-ipv4" {
  security_group_id = aws_security_group.dev_sg.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = "80"
  ip_protocol = "tcp"
  to_port =  "80"
}
resource "aws_vpc_security_group_ingress_rule" "allow-22-ipv4" {
  security_group_id = aws_security_group.dev_sg.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = "22"
  ip_protocol = "tcp"
  to_port =  "22"
}
resource "aws_vpc_security_group_ingress_rule" "allow-22-ipv6" {
  security_group_id = aws_security_group.dev_sg.id
  cidr_ipv6 = "::/0"
  from_port = "22"
  ip_protocol = "tcp"
  to_port =  "22"
}
resource "aws_vpc_security_group_egress_rule" "allow-all-ipv4" {
    security_group_id = aws_security_group.dev_sg.id
    ip_protocol = "-1"
    cidr_ipv4 = "0.0.0.0/0"

}
resource "aws_vpc_security_group_egress_rule" "allow-all-ipv6" {
    security_group_id = aws_security_group.dev_sg.id
    ip_protocol = "-1"
    cidr_ipv6 = "::/0"
  
}
resource "aws_security_group" "dev_sg1" {
  name   = "dev_seg_mysql_port"
  vpc_id = aws_vpc.dev.id
  tags = {
    env = "dev"
  }
}
resource "aws_vpc_security_group_ingress_rule" "allow-3306-ipv4" {
  security_group_id = aws_security_group.dev_sg1.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = "3306"
  ip_protocol = "tcp"
  to_port =  "3306"
}
resource "aws_vpc_security_group_ingress_rule" "allow-3306-ipv6" {
  security_group_id = aws_security_group.dev_sg.id
  cidr_ipv6 = "::/0"
  from_port = "3306"
  ip_protocol = "tcp"
  to_port =  "3306"
}
resource "aws_route_table_association" "rt_association" {
  subnet_id = aws_subnet.subnet-1a.id
  route_table_id = aws_vpc.dev.default_route_table_id
}
resource "aws_route" "rt" {
  route_table_id = aws_vpc.dev.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw_dev.id
}

resource "aws_route" "public-internet-gw-route" {
  route_table_id = aws_vpc.dev.default_route_table_id
  destination_cidr_block  = "0.0.0.0/0"
  gateway_id              = aws_internet_gateway.igw_dev.id
}