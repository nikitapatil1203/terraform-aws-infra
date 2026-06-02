resource "aws_vpc" "my_vpc_east" {
  cidr_block = var.cidr_block
}

resource "aws_internet_gateway" "internet_gateway_east" {
  vpc_id   = aws_vpc.my_vpc_east.id
}


resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.my_vpc_east.id

  route {
    cidr_block = "0.0.0.0/0"      #where traffic should go when leaving the subnet - 0.0.0.0/0 (towards igw).
    gateway_id = aws_internet_gateway.internet_gateway_east.id
  }
}


resource "aws_subnet" "public_subnet_east" {
  vpc_id     = aws_vpc.my_vpc_east.id
  cidr_block = var.subnet_cidr_range
}


resource "aws_route_table_association" "example" {
  subnet_id      = aws_subnet.public_subnet_east.id
  route_table_id = aws_route_table.route_table.id
}


