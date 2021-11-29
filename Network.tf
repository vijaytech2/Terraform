resource "aws_vpc" "myvpc10" {
  cidr_block = "${var.vpc_custom}"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    name = "myvpc10"
  }
}

resource "aws_subnet" "subnet10_public" {
  vpc_id = "${aws_vpc.myvpc10.id}"
  cidr_block = "${var.subnet-public-AZ-CIDR}"
  tags = {
    name = "public_subnet10"
  }
}

resource "aws_subnet" "subnet10_private" {
  vpc_id = "${aws_vpc.myvpc10.id}"
  cidr_block = "${var.subnet-private-AZ-CIDR}"
  tags = {
    name = "private_subnet10"
}
}
