terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  alias  = "us-east-region"
  region = "us-east-1"
}

provider "aws" {
  alias  = "us-west-region"
  region = "us-west-1"
}

