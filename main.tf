
module "vpc" {
  source            = "./modules/vpc"
  cidr_block        = var.cidr_block
  subnet_cidr_range = var.subnet_cidr_range
}

module "ec2_instance" {
  source        = "./modules/ec2_instance"
  vpc_id        = module.vpc.vpc_id
  instance_type = var.instance_type
  ami_value     = var.ami_value
  subnet_id     = module.vpc.subnet_id
  key_name      = var.key_name

}

resource "aws_s3_bucket" "s3-bucket" {
  bucket = "nikita-s3-bucket-testing"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "s3-bucket-privacy" {
  bucket = aws_s3_bucket.s3-bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "s3-bucket-versioning" {
  bucket = aws_s3_bucket.s3-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
  
}

resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"           #lockId type is string
  }
}
