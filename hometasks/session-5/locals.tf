locals {
  name = "aws-${var.prod}-${var.Team}-${var.Env}-${var.Env}-${var.application_tier}-%s"
  common_tages = {
    Teame       = var.prod
    Env         = var.Team
    Project     = var.Env
    Application = var.application_tier
    ManagedBY   = var.ManagedBY
    Owner       = var.owner
  }
}