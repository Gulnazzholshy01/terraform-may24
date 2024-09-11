resource "aws_instance" "web-2" {
  count                       = length(var.environments)
  ami                         = var.amazon_linux_ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.main.id]
  user_data_replace_on_change = true
  user_data                   = file("./extra/userdata.sh")

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "my-webserver-${var.environments[count.index]}"
    env  = var.environments[count.index]
  }
}

/*
 
 for [ITEM] in [LIST] : <OUTPUT> -> transform from one data type to another data type


*/

# output "instance_ids" {
#     value = aws_instance.web-2[*].id
# }


output "instance_ids_with_for" {
    value = [ for instance in aws_instance.web-2 : instance.id ]
}
 

output "instance_ids_with_for_2" {
    value = [ for instance in aws_instance.web-2 : instance.public_ip ]
}
 

output "instance_ids_with_for_3" {
    value = { for instance in aws_instance.web-2 : instance.tags["Name"] => instance.public_ip }
}


resource "aws_security_group" "main" {
  name        = "my-sg"
  description = "Allow port 80"
  tags = {
    Name = "my-sg"
    env  = var.env
  }
}


# resource "aws_vpc_security_group_ingress_rule" "http" {
#   count = length(var.ports)
#   security_group_id = aws_security_group.main.id
#   cidr_ipv4         = element(var.cidrs. count.index)
#   from_port         = element(var.ports, count.index) 
#   ip_protocol       = "tcp"
#   to_port           = element(var.ports, count.index) 
# }




resource "aws_vpc_security_group_ingress_rule" "http" {
  for_each          = var.ports_cidrs_map // map(object)
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = each.value.cidr_ipv4
  from_port         = each.value.from_port
  ip_protocol       = each.value.protocol
  to_port           = each.value.to_port
}


locals {
  ports = [80, 22, 443]
}

# resource "aws_security_group" "mysg" {
#   name        = "webserver"
#   description = "Inbound Rules for WebServer"

#   dynamic "ingress" {
#     for_each = local.ports
#     content {
#       description = "description ${ingress.key}"
#       from_port   = ingress.value
#       to_port     = ingress.value
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#     }
#   }
# }


resource "aws_vpc_security_group_egress_rule" "all" {
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

