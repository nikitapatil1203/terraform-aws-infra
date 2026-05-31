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
  type        = string
}

variable "key_name" {
  description = "key_name"
  type        = string
}


variable "bucket_name" {
  description = "bucket_name"
  type        = string
}

variable "bucket_tag" {
  description = "bucket_tag"
  type        = string
}

variable "bucket_environment" {
  description = "bucket_environment"
  type        = string
}


variable "aws_s3_bucket_versioning" {
  description = "aws_s3_bucket_versioning"
  type        = string
}