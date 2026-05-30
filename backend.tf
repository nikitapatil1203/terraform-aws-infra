terraform {
  backend "s3" {
    bucket         = "nikita-s3-bucket-testing" 
    key            = "nikita/terraform.tfstate"                       # folders inside s3 bucket
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}

