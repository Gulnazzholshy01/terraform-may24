resource "aws_instance" "web" {
  ami           = "ami-0ed6534c7d6a8e78f"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-instance-1"
  }
}

resource "aws_instance" "web-1" {
  ami           = "ami-0ed6534c7d6a8e78f"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-instance-2"
  }
}

resource "aws_instance" "web-2" {
  ami           = "ami-0ed6534c7d6a8e78f"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-instance-2"
  }
}



/* 


"aws_instance" - PROVIDER_TYPE - first label, terraform defined 
"web" - Logical ID/ Name - second labed, defined by you, should be unique 
ami, instance_type - arguments - settings or resource configuration 
resource - block 

terraform init --> terraform fmt --> terraform plan --> terraform apply 

WRITE -> PLAN -> APPLY


Plugins: 1. Provider.    2. Provisioner 
*/
