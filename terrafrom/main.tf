terraform {
  required_version = ">= 1.3.0"

  backend "s3" {
  bucket = "terraform init -reconfigure" 
  key    = "gradproject/terraform.tfstate"
  region = "us-east-1"
}
}

provider "aws" {
  region = "us-east-1"
}
