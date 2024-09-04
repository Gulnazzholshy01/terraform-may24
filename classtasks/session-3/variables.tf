variable "instance_type" {
  type        = string
  description = "This is ec2 instance type"
  default     = "t2.micro"
}


variable "env" {
  type        = string
  description = "This is Env"
  default     = "dev"
}


// Variable reference = var.<NAME-OF-VARIABLE>

