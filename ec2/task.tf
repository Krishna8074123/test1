provider "aws" {
  region = "ap-southeast-2"
}
resource "aws_vpc" "aws_vpc" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "aws_vpc"
  }
}
resource "aws_subnet" "subnet" {
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
  name        = "security-group"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.aws_vpc.id
  ingress {
    description = "tcp from vpc"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.aws_vpc.cidr_block]
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
  vpc = true
  instance = aws_instance.my_first_instance.id
  depends_on = [
    aws_instance.my_first_instance
  ]
}
resource "aws_instance" "my_first_instance"{
  ami                    = "ami-09a5c873bc79530d9"
  instance_type          = "t2.micro"
  key_name               = "jenkins-task"
  subnet_id = aws_subnet.subnet.id
  security_groups         = [aws_security_group.aws_asg.id]
  
  tags = {
 Name = "ec2_instance"
  }
  # provisioner "remote-exec" {
  # connection {
  #   host = aws_eip.eip.address
  #   type = "ssh"
  #   user = "ubuntu"
  #   password = "-----BEGIN OPENSSH PRIVATE KEY-----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-----END OPENSSH PRIVATE KEY-----"
  # }
  # }
}





