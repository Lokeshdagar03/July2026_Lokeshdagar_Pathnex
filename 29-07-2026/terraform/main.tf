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

resource "aws_vpc" "pathnex_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "pathnex-day29-vpc"
  }
}

resource "aws_subnet" "pathnex_subnet" {
  vpc_id            = aws_vpc.pathnex_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "pathnex-day29-subnet"
  }
}

resource "aws_security_group" "pathnex_sg" {
  name   = "pathnex-day29-sg"
  vpc_id = aws_vpc.pathnex_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "pathnex-day29-sg"
  }
}
