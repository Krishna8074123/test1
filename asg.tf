# # module "asg" {
# #   source = "terraform-aws-modules/autoscaling/aws"
# # # resource "aws_launch_configuration" "launchconfig" {
# # #   name          = "web_config"
# # #   image_id      = "ami-09d9cd8609744f0d0"
# # #   instance_type = "t2.micro"
# # #   key_name      = "jenkins-master"
# # #   security_groups = [
# # #     aws_security_group.aws_sg.id
# # #   ]
# # asg_name                  = "aws-asg"
# # vpc_zone_identifier       = ["ap-southeast-2b"]
# # health_check_type         = "EC2"
# # min_size                  = 1
# # max_size                  = 1
# # desired_capacity          = 1
# # wait_for_capacity_timeout = 60

# # tags = [
# #   {
# #     key                 = "Environment"
# #     value               = "dev"
# #     propagate_at_launch = true
# #   }
# # ]
# # }
# resource "aws_launch_template" "launch_template" {
#   name_prefix   = "template"
#   image_id      = "ami-09d9cd8609744f0d0"
#   instance_type = "t2.micro"
# }

# resource "aws_autoscaling_group" "aws_asg" {
#   availability_zones = ["ap-southeast-2b"]
#   desired_capacity   = 1
#   max_size           = 1
#   min_size           = 1

#   mixed_instances_policy {
#     launch_template {
#       launch_template_specification {
#         launch_template_id = aws_launch_template.launch_template.id
#       }

#       override {
#         instance_type     = "t2.micro"
#         weighted_capacity = "1"
#       }
#     }
#   }
# }





