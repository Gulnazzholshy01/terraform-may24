terraform {

  required_version = ">=1.7.4, <1.8" //terraform core/ terraform binary version

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.63.0"
      // versions = "~> 5.63.0"       ">=5.63.0, <5.64". 5.63.1   5.63.2  5.63.4.....
    }
  }
}

/*


5.63.0  - semantic versioning 
5 - major, breaking changes 
63 - minor, extra features 
0 - patch, bugs 

*/