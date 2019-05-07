resource "aws_internet_gateway" "tf_internet_gateway" {
  vpc_id = "${aws_vpc.tf_vpc.id}"

  tags {
    Name = "tf_igw"
  }
}

resource "aws_route_table" "public_rt"{
    vpc_id = "${aws_vpc.tf_vpc.id}"

    route {
        cidr_block = "0.0.0.0/0"
         gateway_id = "${aws_internet_gateway.tf_internet_gateway.id}"
    }


    tags {
        Name = "swarm_rt_public"
    }
}


resource "aws_route_table_association" "rt_public_assoc" {
    subnet_id        = "${aws_subnet.subnet_public.id}"
    route_table_id = "${aws_route_table.public_rt.id}"
}