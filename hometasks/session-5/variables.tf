variable "instance_type" {
  type        = string
  description = "This is ec2 instance type"
  default     = "t2.micro"

}

variable "amazon_linux_ami" {
  default = "ami-0ebfd941bbafe70c6"

}


variable "prod" {
  default = "aws"

}
variable "Team" {
  default = "devops"

}
variable "Env" {
  default = "dev"

}
variable "project" {
  default = "supper"

}
variable "application_tier" {
  default = "frontent"

}

variable "ManagedBY" {
  default = "terraforme"

}
variable "owner" {
  default = "fatima"

}


variable "environments" {
  type        = list(string)
  description = "this is Env"
  default     = ["dev", "qa", "prod", "test"]
}

variable "env" {
  default = "placeholder"

}

variable "ports" {
  type    = list(number)
  default = ["80", "443", "22"]
}

variable "test" {
  default = ""

}

variable "template_sg" {
  default = ["80", "443"]
}

variable "domain" {
  default = "cloudishedu.com"
}