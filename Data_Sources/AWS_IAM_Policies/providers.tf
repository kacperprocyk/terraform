terraform {
  required_providers {
    aws = {
      source  = "aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}