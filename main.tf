provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "my_bucket" {
  bucket_prefix = var.bucket_prefix
  tags = var.tags
}

resource "aws_s3_bucket_versioning" "versioning_bucket" {
  bucket = aws_s3_bucket.my_bucket.id

  versioning_configuration {
    status = var.versioning
  }
}

resource "aws_s3_bucket_acl" "my_bucket_acl" {
  bucket = aws_s3_bucket.my_bucket.id
  acl    = var.acl
}
