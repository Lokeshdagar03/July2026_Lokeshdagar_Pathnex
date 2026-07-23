provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "pathnex_backup" {
  bucket = "pathnex-backup-bucket-lokesh"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.pathnex_backup.id

  versioning_configuration {
    status = "Enabled"
  }
}
