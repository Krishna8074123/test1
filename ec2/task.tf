provider "aws" {
  region = "ap-southeast-2"
}
resource "aws_vpc" "aws_vpc" {
  cidr_block           = "10.10.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "aws_vpc"
  }
}
resource "aws_subnet" "public_subnet" {
  cidr_block = "10.10.1.0/24"
  vpc_id     = aws_vpc.aws_vpc.id
  tags = {
    Name = "subnet"
  }
  depends_on = [
    aws_vpc.aws_vpc
  ]
}
resource "aws_security_group" "aws_asg" {
  name        = "security-groups"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.aws_vpc.id
  ingress {
    description = "tcp from vpc"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "sgroup"
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.aws_vpc.id

  tags = {
    Name = "main"
  }
}
resource "aws_eip" "eip" {
tags = {
  "Name" = "eip"
}
}
resource "aws_nat_gateway" "nat" {
    subnet_id = aws_subnet.public_subnet.id
    allocation_id = aws_eip.eip.id
    depends_on = [
      aws_eip.eip,
      aws_subnet.public_subnet
    ]
}
resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.aws_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "public_route"
  }
}
resource "aws_route_table_association" "public_route_subnets" {
#   count = length(var.public_subnet)
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route.id
}
resource "aws_instance" "my_first_instance" {
  ami                         = "ami-055166f8a8041fbf1"
  instance_type               = "t2.micro"
  key_name                    = "jenkins-task"
  monitoring                  = true
  subnet_id                   = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  security_groups             = [aws_security_group.aws_asg.id]

  tags = {
    Name = "ec2_instance"
  }
  
}





