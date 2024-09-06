variable "instance_type" {
  type        = string
  description = "This is ec2 instance type"
  default     = "t2.micro"
}


variable "environments" {
  type        = list(string)
  description = "This is Env"
  default     = ["dev", "qa", "prod", "stage", "test"]
}

variable "amazon_linux_ami"{
    default = "ami-0182f373e66f89c85"
}

variable "env" {
  default = "placeholder"
}

variable "ports"{
    type = list(number)
    default = [80, 443, 8080]
}

variable "cidrs" {
    type = list(string)
    default = ["0.0.0.0/0", "10.0.0.0/16", "162.234.34.23"  ]
  
}