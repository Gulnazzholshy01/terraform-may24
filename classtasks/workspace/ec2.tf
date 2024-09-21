resource "aws_instance" "web" {
  ami                         = data.aws_ami.myubuntu.id
  instance_type               = var.instance_type
  user_data_replace_on_change = true
  tags = {
    Name    = "my-${var.env}" 
    env     = var.env
  }
}



