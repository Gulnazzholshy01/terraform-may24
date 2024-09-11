locals {
  common_tags = {
    Team             = var.team
    Env              = var.env
    Project          = var.project
    Application_tier = var.application_tier
    ManagedBy        = var.ManagedBy
    Owner            = var.owner
  }
  name = "aws-${var.team}-${var.env}-${var.project}-${var.application_tier}-rtype"
}


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