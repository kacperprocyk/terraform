resource "aws_security_group" "web_sg" {
  name   = "Project_HTTP_and_HTTPS_SG"
  vpc_id = aws_vpc.project_vpc.id
}

resource "aws_vpc_security_group_ingress_rule" "web_http" {
  security_group_id = aws_security_group.web_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "web_https" {
  security_group_id = aws_security_group.web_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "web_ssh" {
  security_group_id = aws_security_group.web_sg.id
  cidr_ipv4         = "45.11.61.97/32"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
}

