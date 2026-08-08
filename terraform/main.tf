terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "l1_ec2" {
  ami           = "ami-0f918f7e67a3323f0"
  instance_type = "t3.micro"

  tags = {
    Name = "L1-Day1-Terraform"
  }
}
