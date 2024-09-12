resource "aws_instance" "web" {
  ami           = "ami-0182f373e66f89c85"
  instance_type = "t3.micro"
  subnet_id = data.terraform_remote_state.remote.outputs.public_subnet_ids

  tags = {
    Name = "HelloWorld"
  }
}