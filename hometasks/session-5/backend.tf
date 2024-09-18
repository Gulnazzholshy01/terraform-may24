terraform {
  backend "s3" {
    bucket = "terraform-may24-1234567890"
    key    = "homeworks/session-5/terraform.tfstate"
    region = "us-east-1"
  }
}