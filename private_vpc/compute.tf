resource "aws_instance" "project_instance" {
  ami                         = "ami-07225f92d1b1d59ed"
  instance_type               = "t3.small"
  associate_public_ip_address = true

  subnet_id = aws_subnet.public_subnet.id
  root_block_device {
    volume_size = 10
    volume_type = "gp3"
  }

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "Project VPC EC2"
  }
  key_name = aws_key_pair.aws_key.id
}


