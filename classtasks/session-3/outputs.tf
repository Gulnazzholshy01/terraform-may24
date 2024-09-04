/*
Output -> outputting attributes of data source OR resource
*/

output "public_ip"{
    value = aws_instance.web-2.public_ip
}

output "instance_arn"{
    value = aws_instance.web-2.arn
}

output "vpc_id"{
    value = data.aws_vpc.default.id
}




