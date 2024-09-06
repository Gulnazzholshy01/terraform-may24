resource "aws_instance" "web-2" {
  count = length(var.environments)
  ami                         = var.amazon_linux_ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.main.id]
  user_data_replace_on_change = true
  user_data                   = file("./extra/userdata.sh")
  
  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name    = "my-webserver-${var.environments[count.index]}" // string interpolation 
    env     = var.environments[count.index]
  }
}


 /*

count = 1
count.index  = 0, count.index+1 , = 1

count = 2
count.index  = 1, count.index+1 , = 2

count = 3
count.index  = 2


["dev", "qa", "prod"]
dev - 0 
qa - 1
prod - 2

my-webserver-dev
my-webserver-qa
my-webserver-prod


my-terraform-webserver-dev-0, my-terraform-webserver-dev-1, my-terraform-webserver-dev-2



list fruit = ["apple" , "banana", "strawberry"]
index -> position of the element 

get.list[0] = apple
get.list[1] = banana
get.list[2] = strawberry
get.list[3] = Index Out of Bount / Index Error 


FUNCTIONS:
length(LIST) -> returns the size or number of elements in the list 

function_name(argument)

 */




resource "aws_security_group" "main" {
  name        = "my-sg"
  description = "Allow port 80"
  tags = {
    Name = "my-sg"
    env  = var.env
  }
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  count = length(var.ports)
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = var.ports[count.index]
  ip_protocol       = "tcp"
  to_port           = var.ports[count.index]
}

/*
1 Iteration: count = 1, count.index = 0, port = 80
2 Iteration: count = 2, count.index = 1, port = 443
3 Iteration: count = 3, count.index = 2, port = 8080


80-90 -> 80, 81, 82, ..... 90 - range = 11
80 -> range 1

*/



resource "aws_vpc_security_group_egress_rule" "all" {
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

# // implicit dependency == reference resource attribute 