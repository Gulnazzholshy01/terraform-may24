variable "instance_type" {
  type        = string
  description = "This is ec2 instance type"
  default     = "t2.micro"
}


variable "environments" {
  type        = list(string)
  description = "This is Env"
  default     = ["dev", "qa", "prod", "stage"]
}

variable "amazon_linux_ami" {
  default = "ami-0182f373e66f89c85"
}

variable "ports" {
  type    = list(number)
  default = [80, 443, 8080, 22]
}

variable "cidrs" {
  type    = list(string)
  default = ["0.0.0.0/0", "0.0.0.0/0", "0.0.0.0/0", "73.74.183.123"]

}

variable "ports_cidrs" {
  type = map(string) // only strings
  default = {
    80   = "0.0.0.0/0"
    443  = "0.0.0.0/0"
    8080 = "0.0.0.0/0"
    22   = "73.74.183.123/32"
  }
}

variable "ports_cidrs_map" {
  # type = map(any)
  type = map(object(
    {
      to_port   = number
      from_port = number
      protocol  = string
      cidr_ipv4 = string
    }
    )
  )

  default = {
    ingress1 = {
      to_port   = 80
      from_port = 80
      protocol  = "tcp"
      cidr_ipv4 = "0.0.0.0/0"
    }
    ingress2 = {
      to_port   = 443
      from_port = 443
      protocol  = "tcp"
      cidr_ipv4 = "0.0.0.0/0"
    }
    ingress3 = {
      to_port   = 8080
      from_port = 8080
      protocol  = "tcp"
      cidr_ipv4 = "0.0.0.0/0"
    }

    ingress4 = {
      to_port   = 22
      from_port = 22
      protocol  = "tcp"
      cidr_ipv4 = "73.74.183.123/32"
    }
  }
}