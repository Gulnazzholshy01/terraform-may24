variable "amazon_linux_ami" {
  default = "ami-0182f373e66f89c85"
}

# variable "provider" {
#   default = "aws"
# }

variable "team" {
  default = "devops"
}

variable "env" {
  default = "prod"
}

variable "project" {
  default = "superapp"
}

variable "application_tier" {
  default = "frontend"
}

variable "ManagedBy" {
  default = "terraform"
}

variable "owner" {
    default = "Gulnaz"
}

/*

1. Provider - aws, gcp, do
2. Team - developer, devops 
3. Environment - dev, qa, stage, prod
4. Project - cloud9, superapp
5. Application Tier - frontend, backend 
6. Resource Type - s3, rds, sns, sqs, ec2 

S3 -> aws-devops-dev-may24-frontend-s3 
EC2 ->  aws-devops-dev-may24-frontend-ec2  

Tagging Standards 
1. Team - developer, devops 
2. Environment - dev, qa, stage, prod
3. Project - cloud9, superapp
4. Application Tier - frontend, backend 
5. ManagedBy - manual, cloudformation, terraform 
6. Owner - Gulnaz 



Local Values - > we can call variables and local values inside of local values 
*/