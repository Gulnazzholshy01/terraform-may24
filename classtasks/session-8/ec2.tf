resource "aws_instance" "web" {
  ami                    = var.amazon_ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.main.id]
  key_name               = aws_key_pair.my_laptop_key.key_name
  tags = {
    Name = "${var.env}-instance"
    env  = var.env
  }
}


resource "null_resource" "remote_script" {
  depends_on = [aws_instance.web]

  triggers = {
    instance_id = aws_instance.web.id
    timestamp   = "${timestamp()}"
  }


  connection {
    type        = "ssh"
    user        = "ec2-user"
    host        = aws_instance.web.public_ip
    private_key = file("~/.ssh/id_rsa")
  }

  provisioner "file" {
    source      = "./index.html"
    destination = "/tmp/index.html"
  }


  provisioner "remote-exec" {
    inline = [
      "echo 'running remote-exec!'",
      "sudo yum update -y",
      "sudo yum install httpd -y",
      "sudo systemctl start httpd ",
      "sudo systemctl enable httpd ",
      "sudo cp /tmp/index.html /var/www/html/index.html"
    ]
  }



}
resource "aws_key_pair" "my_laptop_key" {
  key_name   = "laptop_key"
  public_key = file("~/.ssh/id_rsa.pub")
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


resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "all" {
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}



