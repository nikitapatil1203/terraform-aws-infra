
output "public_ip_address" {
  description = "EC2 Instance Public IP Address"
  value       = aws_instance.ec2_instance_east.public_ip
}

output "security_group_east_id" {
  description = "EC2 Instance Public IP Address"
  value       = aws_security_group.security_group_east.id
}