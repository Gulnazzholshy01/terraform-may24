data "terraform_remote_state" "remote" {
  backend = "s3"
  config = {
    bucket = "terraform-may24-1234567890"
    key    = "homeworks/session-4/terraform.tfstate"
    region = "us-east-1"
  }
}