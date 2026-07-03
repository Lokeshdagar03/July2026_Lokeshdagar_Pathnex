provider "aws" {region = "us-east-1"}
resource "aws_instance" "pathnexEC2"
{ami        = "ami-0abcd1234abcd1234"
instance_type = "t3.medium"

tags = { name = "pathnex-t3"}}
