data "aws_iam_policy_document" "example_policy" {
  statement {
    sid = "PublicReadGetObject"

    principals {
      type        = "*"
      identifiers = ["*"]
    }
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.public_read_bucket.arn}/*"]
  }
}

data "aws_region" "current_region" {}

resource "aws_s3_bucket" "public_read_bucket" {
  bucket = "pub-read-bucket"
}

output "iam_policy" {
  value = data.aws_iam_policy_document.example_policy.id
}

output "current_region" {
  value = data.aws_region.current_region
}