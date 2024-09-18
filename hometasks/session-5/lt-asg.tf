resource "aws_launch_template" "ec2" {
  image_id      = var.amazon_linux_ami
  instance_type = var.instance_type
  key_name = "GulnazMacBook"
  vpc_security_group_ids = [aws_security_group.sg.id]
  network_interfaces {
    associate_public_ip_address = false
    subnet_id = data.terraform_remote_state.remote.outputs.private_subnet_ids[1]
    security_groups = aws_security_group.lt-sg.id
  }
  user_data              = filebase64("userdata.sh")  
}




