
output "public_ip_address" {
  description = "EC2 Instance Public IP Address"
  value       = aws_instance.ec2_instance_east.public_ip
}