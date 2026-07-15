terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 6.0"
      }
    }
}

# Managed/created by us, by our TF project
resource "aws_s3_bucket" "my_bucket" {
    bucket = var.bucket_name
}

# "data" source is used to retrieve information from remote API's; managed somewhere else, we just want to use it in our project
data "aws_s3_bucket" "my_external_bucket" {
    bucket = "not-managed-by-us"
}

variable "bucket_name" {
    type = string
    description = "my variable to set bucket name"
    default = "my_default_bucket_name"
}

output "bucket_id" {
    value = aws_s3_bucket.my_bucket.id
}

locals {
    local_example = "this is a local variable"
}

module "my_module" {
  source = "./module-example"
}