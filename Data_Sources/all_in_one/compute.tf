data "aws_ami" "ubuntu-eu-north" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-*/ubuntu-*-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# output "ubuntu_ami_data_eu-north" {
#   value = data.aws_ami.ubuntu-eu-north.id
# }
# #----------------------------------
# data "aws_caller_identity" "current" {}
# data "aws_region" "current" {}
# data "aws_vpc" "current_vpc" {}
# data "aws_availability_zones" "available" {
#   state = "available"
# }

data "aws_iam_policy_document" "static_website" {
  statement {
    sid = "PublicReadGetObject"
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.testowyBucket.arn}/*"]
  }
}

output "staticWebsitePolicy" {
  value = data.aws_iam_policy_document.static_website.json
}

resource "aws_s3_bucket" "testowyBucket" {
  bucket = "testowyBucket-publicRead"
}

# output "aws_caller_identity" {
#   value = data.aws_caller_identity.current
# }

# output "AWS_current_region" {
#   value = data.aws_region.current
# }

# output "AWS_current_VPC" {
#   value = data.aws_vpc.current_vpc
# }

# output "AWS_current_AZ" {
#   value = data.aws_availability_zones.available
# }
#----------------------------------

# resource "aws_instance" "testetst" {
#   ami                         = data.aws_ami.ubuntu-eu-north.id
#   associate_public_ip_address = true
#   instance_type               = "t3-micro"

#   root_block_device {
#     delete_on_termination = true
#     volume_size           = 10
#     volume_type           = "gp3"
#   }
# }