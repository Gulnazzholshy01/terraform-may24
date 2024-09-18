module "vpc" {

    //Required 
    source = "github.com/Gulnazzholshy01/tf-modules//vpc?ref=v0.0.1"

              //domain/repo//path/to/childmodule
    
    /*
    github.com - domain 
    Gulnazzholshy01 - username
    tf-modules - repo name
    tree ? 
    main - default branch 
    vpc - subdir for VPC child module


    ?ref=branch-name
    ?ref=v0.0.1 - release
    ?ref=73qw4etgysfersrcwsvvrcq5w345eret 
    REVISION - release



    v0.0.1
    v0.0.2

    */

    //Input variables
    vpc_cidr = "10.0.0.0/16"
    private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]
    public_subnet_cidrs = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
    azs = ["us-east-1a", "us-east-1b", "us-east-1c"]
    env = "stage"
}
