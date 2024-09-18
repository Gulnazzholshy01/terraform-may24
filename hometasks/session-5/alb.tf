resource "aws_lb" "test" {
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = data.terraform_remote_state.remote.outputs.public_subnet_ids
  tags = merge(
    { Name = format(local.name, "alb") },
    local.common_tages
  )
}


resource "aws_security_group" "alb" {
  name        = "terraform_alb_security_group"
  description = "Terraform load balancer security group"
  vpc_id      = data.terraform_remote_state.remote.outputs.vpc_id

 ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb_target_group" "my_tg" {
  name     = "alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.terraform_remote_state.remote.outputs.vpc_id
}

resource "aws_alb_listener" "http"{
  load_balancer_arn = aws_lb.test.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_tg.arn
  }

}