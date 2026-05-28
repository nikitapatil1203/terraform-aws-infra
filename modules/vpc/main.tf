resource "aws_vpc" "my_vpc_east" {
  cidr_block = var.cidr_block
}



resource "aws_internet_gateway" "internet_gateway_east" {
  vpc_id   = aws_vpc.my_vpc_east.id
}


resource "aws_subnet" "private_subnet_east" {
  vpc_id     = aws_vpc.my_vpc_east.id
  cidr_block = var.subnet_cidr_range

}


