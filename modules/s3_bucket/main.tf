resource "aws_s3_bucket" "s3-bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_tag
    Environment = var.bucket_environment
  }
}


resource "aws_s3_bucket_versioning" "s3-bucket-versioning" {
  bucket = aws_s3_bucket.s3-bucket.id
  
  versioning_configuration {
    status = var.aws_s3_bucket_versioning
  }

}