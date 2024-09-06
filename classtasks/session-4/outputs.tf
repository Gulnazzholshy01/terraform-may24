output "public_ip_dev"{
    value = aws_instance.web-2[0].public_ip
}

# output "instance_arn_prod"{
#     value = aws_instance.web-2.2.arn
# }

output "instance_arn_prod"{
    value = aws_instance.web-2[2].arn
}


output "private_ip_qa"{
    value = aws_instance.web-2.1.private_ip
}

# output "id" {
#   value = aws_instance.web-2.*.id
# }

output "id" {
  value = aws_instance.web-2[*].id
}

