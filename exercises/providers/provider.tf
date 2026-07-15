terraform {
  required_version = "~> 1.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

provider "aws" {
  region = "eu-west-1"
  alias  = "eu-west"
}

resource "aws_s3_bucket" "eu-north-1" {
  bucket = "kapro-bucket-name-676767"
}

resource "aws_s3_bucket" "eu-west-1" {
  bucket   = "kacpro-west-bucket-797979"
  provider = aws.eu-west
}