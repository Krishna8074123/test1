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
resource "aws_instance" "my_first_instance"{
  ami                    = "ami-09a5c873bc79530d9"
  instance_type          = "t2.micro"
  key_name               = "jenkins-task"
  subnet_id = aws_subnet.subnet.id
  security_groups         = [aws_security_group.aws_asg.id]
  
  tags = {
 Name = "ec2_instance"
  }
  provisioner "local-exec" {
  connection {
    command = "echo 'its working'"
  }
  }
}





