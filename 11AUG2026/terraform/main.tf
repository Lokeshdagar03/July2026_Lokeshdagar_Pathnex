provider "aws" {
  region = "ap-south-1"
}

resource "aws_iam_role" "ec2_role" {
  name = "pathnex_ec2_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}
