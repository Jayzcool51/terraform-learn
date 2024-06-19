terraform {
  required_providers {      #terraform - provider AWS
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0" # terraform version
}

provider "aws" {            #aws region
  region = "us-west-2"
}

resource "aws_instance" "app_server" {    #resource - ec2 instance 
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t2.micro"               

  tags = {
   Name = "example"
  }
}
