resource "aws_s3_bucket" "main" {
  bucket = var.id

  tags = {
    Name = var.name
  }
}

resource "aws_s3_bucket_acl" "main" {
  bucket = aws_s3_bucket.main.id
  acl    = var.acl
}

resource "aws_s3_bucket_versioning" "main" {
  bucket = aws_s3_bucket.main.id
  versioning_configuration {
    status = var.versioning == true ? "Enabled" : "Disabled"
  }
}