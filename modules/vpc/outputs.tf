output "vpc_id"{
    value = aws_vpc.my_vpc_east.id
}

output "subnet_id"{
    value = aws_subnet.public_subnet_east.id
}