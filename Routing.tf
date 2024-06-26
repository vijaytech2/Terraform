resource "aws_internet_gateway" "gw" {
   vpc_id= "${aws_vpc.myvpc10.id}"
   tags = {
     name = "myvpc10"
   }

}

resource "aws_route_table" "public" {
    vpc_id= "${aws_vpc.myvpc10.id}"
	tags = {
	  name = "public"
	}
	route {
	  cidr_block= "0.0.0.0/0"
	  gateway_id= "${aws_internet_gateway.gw.id}"
	}

}

resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.subnet10_public.id
  route_table_id = aws_route_table.public.id
}