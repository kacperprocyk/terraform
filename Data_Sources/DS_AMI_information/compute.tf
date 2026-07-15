# data "aws_ami" "ubuntu-eu-west" {
#   most_recent = true
#   owners      = ["099720109477"]
#   provider    = aws.eu_west

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-*/ubuntu-*-24.04-amd64-server-*"] # output of: aws ec2 describe-images --image-ids ami-05bfa4a7765f38076
#   }
#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
# }
#----------------------------------------------------
data "aws_ami" "ubuntu-eu-north" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-*/ubuntu-*-24.04-amd64-server-*"] # output of: aws ec2 describe-images --image-ids ami-05bfa4a7765f38076
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

output "ubuntu_ami_data_eu-north" {
  value = data.aws_ami.ubuntu-eu-north.id
}

# output "ubuntu_ami_data_eu-west" {
#   value = data.aws_ami.ubuntu-eu-west.id
# }

resource "aws_instance" "testetst" {
  ami                         = data.aws_ami.ubuntu-eu-north.id
  associate_public_ip_address = true
  instance_type               = "t3-micro"

  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp3"
  }
}