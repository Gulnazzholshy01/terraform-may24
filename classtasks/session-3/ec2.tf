resource "aws_instance" "web-2" {
  ami                         = data.aws_ami.myubuntu.id
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.main.id]
  user_data_replace_on_change = true
  user_data                   = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<html><body><h1>Session-4 homework is ${env}! </h1></body></html>" > /var/www/html/index.html
              EOF
  tags = {
    Name    = "my-terraform-webserver-${var.env}" // string interpolation 
    env     = var.env
    purpose = "test-for-${var.env}"
  }
}

resource "aws_security_group" "main" {
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


//How to reference to resource attribute
// FIRSTLABEL.SECONDLABEL.attribute  ====> resource attribute reference !REF 


// resource attribute reference  = implicit dependency 

/*
argument is configuration, known before creation
attribute is property of resource, known after creation

Data types:
1. list = []
2. integer = 1 ,2 , 4, 787
3. string = "Gulnaz"
4. boolean = true, false 
5. tuple = ("apple", "banana", "melon")
6. dictioninary / map = {key-value} tag = { Name = "my-sg"}

singular and plural arguments 
plural ---> list [] 

string interpolation  --- embedding variable value within the string


*/



