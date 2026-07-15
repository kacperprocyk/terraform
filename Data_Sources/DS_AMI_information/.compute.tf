data "aws_ami" "ubuntu-eu-north" {
  most_recent = true
  owners      = ["099720109477"]
  provider = aws.eu-north

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-resolute-26.04-amd64-server-*"]
    # command used to search for a value: aws ec2 describe-images --image-ids ami-05d62b9bc5a6ca605
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current
}

output "ubuntu-ami-data-eu-north" {
  value = data.aws_ami.ubuntu-eu-north.id
}

resource "aws_instance" "web_server" {
  ami                         = data.aws_ami.ubuntu-eu-north.id
  associate_public_ip_address = true
  instance_type               = "t3.micro"

  root_block_device { #definiowanie dysku
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp3"
  }
  tags = {
    Name = "data-source-instance"
  }
}