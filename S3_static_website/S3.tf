resource "random_id" "bucket_suffix" {
  byte_length = 5
}

resource "aws_s3_bucket" "s3_web" {
  bucket = "s3-web-bucket-${random_id.bucket_suffix.hex}"
}

resource "aws_s3_bucket_public_access_block" "s3_web" {
  bucket                  = aws_s3_bucket.s3_web.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "s3_web_public_read" {
  bucket = aws_s3_bucket.s3_web.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.s3_web.arn}/*"
      }
    ]
  })
  depends_on = [aws_s3_bucket.s3_web, aws_s3_bucket_public_access_block.s3_web]
}

resource "aws_s3_bucket_website_configuration" "s3_web" {
  bucket = aws_s3_bucket.s3_web.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}

resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.s3_web.id
  key          = "index.html"
  source       = "build/index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "error_html" {
  bucket       = aws_s3_bucket.s3_web.id
  key          = "error.html"
  source       = "build/error.html"
  content_type = "text/html"
}