

resource "aws_instance" "ec2_instance_east" {
  instance_type               = var.instance_type
  ami                         = var.ami_value
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.security_group_east.id]
  key_name                    = var.key_name
  associate_public_ip_address = true
  
  tags = {
    Name = "my_instance"
  }


  # Connection block tells provisioners how to access the remote EC2 instance
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("add .pem file path")
   # private_key = var.key_name
    host        = self.public_ip
  }

   # 1. File Provisioner: Copies a local script to the EC2 instance
  provisioner "file" {
    source      = "add app.py path"
    destination = "/home/ubuntu/app.py"
  }

  # 2. Remote-Exec Provisioner: Executes the copied script on the EC2 instance
  provisioner "remote-exec" {
    inline = [
     "sudo apt update",
     "sudo apt install python3-pip python3-venv -y",
     "pip3 install flask --break-system-packages",
     "nohup sudo python3 /home/ubuntu/app.py > /home/ubuntu/app.log 2>&1 &" 
    ]
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

  ingress {
    protocol  = "tcp"
    to_port   = 80
    from_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol  = "tcp"
    to_port   = 5000
    from_port = 5000
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
}



