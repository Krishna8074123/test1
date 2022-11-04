# resource "aws_instance" "first_instance"{
#   ami                    =  "ami-09d9cd8609744f0d0"
#   instance_type          = "t2.micro"
#   key_name               = "jenkins-master"
#   subnet_id = aws_subnet.subnet.id
#   security_groups         = [aws_security_group.aws_sg.id]
  
#   tags = {
#  Name = "ec2_instance"
#   }
# }