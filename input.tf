variable "ami_value" {
  description = "ami_value"
  type        = string
}

variable "cidr_block" {
  description = "cidr_ange"
  type        = string
}

variable "subnet_cidr_range" {
  description = "subnet_cidr_range"
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