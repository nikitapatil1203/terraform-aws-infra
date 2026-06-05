variable "ami_value" {
  description = "ami_value"
  type        = string
}

variable "cidr_block" {
  description = "cidr_block"
  type        = string
}

variable "subnet_cidr_range" {
  description = "subnet_cidr_range"
  type        = string
}

variable "instance_type" {
  description = "instance_type"
  type        = map(string)
  default = {
    "dev"   = "t3.micro"
    "stage" = "t3.small"
  }

}

variable "key_name" {
  description = "key_name"
  type        = string
}

