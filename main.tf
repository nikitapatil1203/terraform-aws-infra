
resource "aws_vpc" "my_vpc_east" {
  cidr_block = var.cidr_block
  provider   = aws.us-east-region
}

resource "aws_vpc" "my_vpc_west" {
  cidr_block = var.cidr_block
  provider   = aws.us-west-region
}


resource "aws_internet_gateway" "internet_gateway_east" {
  vpc_id   = aws_vpc.my_vpc_east.id
  provider = aws.us-east-region
}


resource "aws_subnet" "private_subnet_east" {
  vpc_id     = aws_vpc.my_vpc_east.id
  cidr_block = var.subnet_cidr_range
  provider   = aws.us-east-region
}

resource "aws_instance" "ec2_instance_east" {
  instance_type               = var.instance_type
  ami                         = var.ami_value
  subnet_id                   = aws_subnet.private_subnet_east.id
  vpc_security_group_ids      = [aws_security_group.security_group_east.id]
  key_name                    = var.key_name
  provider                    = aws.us-east-region
  associate_public_ip_address = true

  tags = {
    Name = "my_instance"
  }
}


resource "aws_security_group" "security_group_east" {
  vpc_id   = aws_vpc.my_vpc_east.id
  provider = aws.us-east-region
  ingress {
    protocol  = "tcp"
    to_port   = 22
    from_port = 22
  }
}

