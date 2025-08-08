terraform {
  required_version = ">= 1.0"
  backend "s3" {
    bucket = "devops-project-bucket-nareman"
    key    = "devops-grad/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
