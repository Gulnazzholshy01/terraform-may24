variable "instance_type" {
  type        = string
  description = "This is ec2 instance type"
  default     = "t2.medium"
}


variable "env" {
  type        = string
  description = "This is Env"
  default     = "dev"
}

variable "amazon_ami" {
  default = "ami-0ebfd941bbafe70c6"
}
// Variable reference = var.<NAME-OF-VARIABLE>

