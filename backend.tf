terraform {
  backend "s3" {
    bucket         = "nikita-s3-bucket-testing-1"
    key            = "nikita/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}

