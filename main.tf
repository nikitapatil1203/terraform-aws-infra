
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"

}

resource "aws_instance" "ec2_instance" {

  instance_type          = "t3.micro"
  ami                    = "ami-091138d0f0d41ff90"
  subnet_id              = aws_subnet.private_subnet.id
  vpc_security_group_ids = [aws_security_group.security_group.id]

}


resource "aws_security_group" "security_group" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    protocol  = "tcp"
    to_port   = 22
    from_port = 22
  }
}