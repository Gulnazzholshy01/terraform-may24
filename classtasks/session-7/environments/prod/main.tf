module "vpc" {

    //Required 
    source = "../../modules/vpc"

    //Input variables
    vpc_cidr = "10.0.0.0/16"
    private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]
    public_subnet_cidrs = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
    azs = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

