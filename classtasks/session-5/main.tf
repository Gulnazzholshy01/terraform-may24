resource "aws_instance" "web" {
  ami           = var.amazon_linux_ami
  instance_type = var.env == "dev" ? "t2.micro": "t2.medium"

  tags = merge(
    {Name = replace(local.name, "rtype", "ec2")},  //"aws-${var.team}-${var.env}-${var.project}-${var.application_tier}-s"
    local.common_tags
  )
   //format(String, "replacement")
   //replace(String, substring, replacement)
}

resource "aws_security_group" "allow_tls" {
  name        = "simple_sg"
  description = "for testing"
  tags = merge(
    {Name = replace(local.name, "rtype", "sg")}, 
    local.common_tags
  )
}



/* 
Problem 1. We can not call Variable within Variable  --> SOLVED

Problem 2. tags is expecting ONE map, 


condition ? true_val : false_val -------> ternary syntax
*/