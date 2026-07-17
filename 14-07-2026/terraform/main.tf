provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "pathnex_bucket" {
  bucket = "pathnex-bucket-demo-lokesh"

  tags = {
    Name = "PathnexBucket"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.pathnex_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket" "pathnex_log_bucket" {
  bucket = "pathnex-log-bucket-demo-lokesh"

  tags = {
    Name = "PathnexLogBucket"
  }
}

resource "aws_s3_bucket_logging" "logging" {
  bucket        = aws_s3_bucket.pathnex_bucket.id
  target_bucket = aws_s3_bucket.pathnex_log_bucket.id
  target_prefix = "logs/"
}
