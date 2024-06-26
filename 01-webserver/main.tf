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

resource "aws_instance" "example" {
  ami                    = "ami-08d70e59c07c61a3a"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]


  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p ${var.server_port} &
              EOF

  user_data_replace_on_change = true

  tags = {
    Name = "terraform-webserver"
  }
}

resource "aws_security_group" "instance" {
  name = "terraform-webserver-sg"

  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}