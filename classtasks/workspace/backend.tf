terraform {
  backend "s3" {
    bucket  = "terraform-may24-1234567890"
    key     = "terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
    workspace_key_prefix = "sessions/workspaces"
  }
}

/*
-> Default workspace:
   sessions/terraform.tfstate 


sessions/workspaces/prod/worksspacename/terraform.tfstate"


sessions/workspaces/prod/stageterraform.tfstate"


-> Dev workspace:
     sessions/workspaces/dev/terraform.tfstate 

-> Prod workspace:
     sessions/workspaces/prod/terraform.tfstate 


*/