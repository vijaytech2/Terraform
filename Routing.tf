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
