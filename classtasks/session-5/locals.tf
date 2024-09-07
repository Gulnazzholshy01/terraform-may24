locals  {
   // map
   common_tags = {
        Team = var.team 
        Env = var.env
        Project = var.project
        Application_tier = var.application_tier
        ManagedBy = var.ManagedBy
        Owner = var.owner
   }
   //string
   purpose = "testing"

   //number
   count = 4
 
   //boolean
   isProd = true
   Team = var.team 

   name = "aws-${var.team}-${var.env}-${var.project}-${var.application_tier}-rtype"
    

}

# locals {
#     name = "aws-${var.team}-${var.env}-${var.project}-${var.application_tier}-ec2"
# }







# variable "common_tags" {
#   type = map(string)
#   default = {
#     Team = var.team 
#     Env = var.env
#     Project = var.project
#     Application_tier = var.application_tier
#     ManagedBy = var.ManagedBy
#     Owner = var.owner
#   }
# }