resource "aws_launch_template" "ec2" {
  image_id      = var.amazon_linux_ami
  instance_type = var.instance_type
  key_name = "GulnazMacBook"
  user_data              = filebase64("${path.module}/extra/userdata.sh")  
  
  network_interfaces {
    associate_public_ip_address = false
    subnet_id = data.terraform_remote_state.remote.outputs.private_subnet_ids[1]
    security_groups = [aws_security_group.sg_for_ec2.id]
  }

}

resource "aws_security_group" "sg_for_ec2" {
  name        = format(local.name, "ec2-sg")
  vpc_id      = data.terraform_remote_state.remote.outputs.vpc_id


  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.alb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_autoscaling_group" "bar" {
  name                      = format(local.name, "asg")
  max_size                  = 3
  min_size                  = 1
  desired_capacity          = 2
  target_group_arns = [ aws_lb_target_group.my_tg.arn ]
  vpc_zone_identifier       = data.terraform_remote_state.remote.outputs.private_subnet_ids[*]

  
launch_template {
    id = aws_launch_template.ec2.id
    version = "$Latest"
     }
}

