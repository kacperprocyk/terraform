locals {
  project = "multiple-resources"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Project = local.project
    Name    = local.project
  }
}

variable "subnet_count" {
  type    = number
  default = 2
}

resource "aws_subnet" "main" {
  count      = var.subnet_count
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.${count.index}.0/24"

  tags = {
    Project = local.project
    Name    = "${local.project}-${count.index}"
  }
}


