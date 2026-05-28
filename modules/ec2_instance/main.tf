

resource "aws_instance" "ec2_instance_east" {
  instance_type               = var.instance_type
  ami                         = var.ami_value
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.security_group_east.id]
  key_name                    = var.key_name
  
  tags = {
    Name = "my_instance"
  }
}


resource "aws_security_group" "security_group_east" {
  vpc_id   = var.vpc_id

  ingress {
    protocol  = "tcp"
    to_port   = 22
    from_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
}

