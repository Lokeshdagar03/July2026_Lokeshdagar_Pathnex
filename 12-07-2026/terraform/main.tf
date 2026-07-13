provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "allow_http" {
  name = "allow-http"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb" "pathnex_lb" {
  name               = "pathnex-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_http.id]

  subnets = [
    "subnet-xxxxxxxx",
    "subnet-yyyyyyyy"
  ]
}

resource "aws_instance" "pathnex_ec2" {
  ami           = "ami-xxxxxxxx"
  instance_type = "t2.micro"

  tags = {
    Name = "Pathnex-EC2"
  }
}
