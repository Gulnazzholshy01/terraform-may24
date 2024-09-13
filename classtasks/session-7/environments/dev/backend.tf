terraform {
  backend "s3" {
    bucket  = "terraform-may24-1234567890"
    key     = "sessions/session-7/modules/dev/terraform.tfstate"
    region  = "us-east-1"
  }
}