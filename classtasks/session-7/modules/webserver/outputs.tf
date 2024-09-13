output "public_ip" {
  value = aws_instance.web-2.public_ip
}

output "instance_arn" {
  value = aws_instance.web-2.arn
}

