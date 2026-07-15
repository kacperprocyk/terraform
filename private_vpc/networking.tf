resource "aws_vpc" "project_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "TF-project-vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.project_vpc.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "Subnet-public"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.project_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Subnet-private"
  }
}

resource "aws_internet_gateway" "project_igw" {
  vpc_id = aws_vpc.project_vpc.id
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.project_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.project_igw.id
  }

  tags = {
    Name = "Project public rt"
  }
}

resource "aws_route_table_association" "public_subnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}