variable "bucket_name"{
    description = "bucket name"
    type = string
}

variable "bucket_tag"{
    description = "bucket tag"
    type = string
}

variable "bucket_environment" {
    description = "bucket environment"
    type = string
}

variable "aws_s3_bucket_versioning" {
    description = "aws_s3_bucket_versioning"
    type = string
}