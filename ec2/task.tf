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
resource "aws_instance" "provisioner" {
  provisioner "local-exec" {
    command = "echo The server's IP address is ${-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAxP5fVffGt2bOMUXbZbjPw6iUQ1JWEWQso+DNcXZQnN+jXlov
BQO2S6lztZJure7k0Wgd4j38K6eU/ySQOcGV3gfU1SXN00zObYypdXFjCBVQWDBJ
ajXtwovw1RMUwaqcxi1itYXqIb0D4lIHvXRQZqjdud5wxfhgisXgdA8o3hpT2WyS
FxMJ7AXWIsN702nnqcF9HJH/zCVUlyrGSuhCX3TscVyNTVBoXLu8ZzoaSS0VWAW/
boj/LtMy0jk/Kb8yxyz02B3Cot6OUipbMt29IVU23olAiEdypedh2gXCuPksoGSW
3fIRqYzD5eC7aSzj/J+l4yzWJ8Z3AOPvg5Ct6wIDAQABAoIBAQC//SntHw8Mr6VF
YE/zU6sphaL5+cToLjlTfkS70BPA0DToP/yTZorEMuISlCRKYAmiDVcSqFacNTeB
cqEdqQ3m1rsXAUEYLkMBgZWmYFukBSHI0Ua7vNN8R+bvwyj3ltA0VQde4qTNPOoM
KOZiPnodk3aFL8W5K9jrZu7aLewmiMxHyd0y/f2FhjLHcHl+0fwBjXuZVYYO7Uua
mbxodXcj9wQhEWf4fftGl6eQ4sezbfBUrV3/BCEwGx5AVzhdVMt4wRQuAYuzXIcn
U9kK0kukef6BlCtyyUCODaeeaaK7PKEJeHm+Q0n4tYvpl1uCWacfnnm+aABy+k3l
Y6le51gBAoGBAOcCxigIFGOIrazAv41Lko4ydhmnfKzMpJVytetmz/l8e93576Or
4xzt0glEJscwLa5iJTmOclwsd/MYFjVhAGkBRaJnsrDEN7nJCe3OiWGvHEJTBDTO
1kQZ9D/idIidmuNv7QMxjn71RndhQdagRik1CtbPvd28fh5mVtCVJPMJAoGBANpN
lVYQKxa6B+dnhHDn/NI0kCU5wpnn9FPjaLTrE8weji+3d6ZibdtRmDM7JXBASSJ2
A7f5WLAjdiAQ4WZuZmJYENNGxquQxFnoL023x3EHvzpVk746xRzA/bDsuX60YYHa
sIKGLi9zH0pXVUEGw613yIXam91gh7OJ75ALFVJTAoGAVsBI79GQ7ovuRJihlosR
v0qd5SZrgGzdRa4tOPiEE3m2/nYUkw9Cm6OHo6kvMtAZ54m91u5ybcDZTrX16RfD
UquCnel5Rj55etBPZTmRh9h9sT6Brt8ZwbtJaRA+mOsutkha5j8e9vhe/QfN9K59
io37ww2CjJlzdzERWwUXOhkCgYAP7BC0UkGSSsdAzYAPbBw4iLTqwie7afucEr4U
VAEBpkjgmhUUAaHZmT3snqfAZC/xX4It7PXXAv8en5yRCARXr+yqPENJSCnKFPE+
TeUyDUqZSpyYB1lRG5JlUR7Gawmhmv28x2Se+VqS5YPGVmP3RwFNIgC0SNIc+jaK
3wQTGQKBgQCJB7LP0MdcbesOWWoN7V5IXJsznqcIFg8Gd5V9zT95RqrNBMpWBsqj
T/LKjZCHuw8tDBvL0IJ5iavDHpdovM9R3wbZIMJL52jwlpsIni6sPqe+2V41CEhJ
J7yfV66AnCxA1THqjnloXwOQtUBQUChVXO/xOS8xl7oLsjNwGl4zkQ==
-----END RSA PRIVATE KEY-----}"
  }
}







