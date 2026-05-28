variable "ami_value" {
  description = "ami_value"
  type        = string
}


variable "instance_type" {
  description = "ec2_instance_type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "key_name"
  type        = string
}


variable "subnet_id" {
  description = "subnet_id"
  type        = string
}



variable "vpc_id" {
  description = "vpc_id"
  type        = string
}