terraform {
  required_version = "~> 1.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket = "kacperprocyk-s3-bucket"
    region = "eu-north-1"
    use_lockfile = true
  }
}

provider "aws" {
  region = "eu-north-1"
}