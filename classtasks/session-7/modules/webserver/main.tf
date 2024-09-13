resource "aws_instance" "web-2" {
  ami                         = data.aws_ami.myubuntu.id
  subnet_id = var.subnet_id
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.main.id]
  user_data_replace_on_change = true
  user_data                   = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install -y apache2
              systemctl start apache2
              systemctl enable apache2
              echo "<html><body><h1> This is WEBSERVER for ${var.env} environment! </h1></body></html>" > /var/www/html/index.html
              EOF
  tags = {
    Name    = "my-terraform-webserver-${var.env}" 
    env     = var.env
  }
}





resource "aws_security_group" "main" {
  vpc_id = var.vpc_id
  name        = "my-sg"
  description = "Allow port 80"

  tags = {
    Name = "my-sg"
    env  = var.env
  }
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}


resource "aws_vpc_security_group_egress_rule" "all" {
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}


