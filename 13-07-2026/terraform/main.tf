provider "aws" {
  region = "ap-south-1"
}

resource "aws_iam_user" "example_user" {
  name = "pathnex_user"
}

resource "aws_iam_policy" "example_policy" {
  name        = "pathnex-policy"
  description = "Policy for Pathnex application"

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "s3:ListBucket"
        ]

        Resource = "arn:aws:s3:::pathnex-bucket"
      }
    ]
  })
}
