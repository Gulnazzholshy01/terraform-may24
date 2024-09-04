terraform {
  backend "s3" {
    bucket  = "terraform-may24-1234567890"
    key     = "sessions/session-3/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}