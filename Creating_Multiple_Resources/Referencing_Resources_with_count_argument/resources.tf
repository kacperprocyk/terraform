data "aws_ami" "ubuntu" {
  most_recent = true
  owners = ["099720109477"]

  filter {
    name = "ubuntu"
    values = "ubuntu/images/hvm*/ubuntu-noble-24.04-amd64-server-*"
  }

  filter {
    name = "virtualization-type"
    values = [ hvm ]
  }
}

locals {
  project = "multiple-resources"
}

variable "ec2_instance_count" {
  type = number
  default = 2
}

resource "aws_instance" "from_count" {
  count = var.ec2_instance_count
  ami = data.aws_ami.ubuntu
  instance_type = "t3.micro"

  tags = {
    Name = "${local.project}-${count.index}"
  }
}