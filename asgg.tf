resource "aws_launch_template" "alts" {
  name          = "tempalte"
  image_id      = "ami-09d9cd8609744f0d0"
  instance_type = "t2.micro"
  key_name      = "jenkins-master"
  monitoring {
    enabled = true
  }
}
resource "aws_launch_configuration" "launchconfig" {
  name          = "web_config"
  image_id      = "ami-09d9cd8609744f0d0"
  instance_type = "t2.micro"
  key_name      = "jenkins-master"
  security_groups = [
    aws_security_group.aws_sg.id
  ]
}

resource "aws_autoscaling_group" "asg" {
  # vpc_id      = aws_vpc.aws_vpc.id
  # availability_zones = ["ap-southeast-2b"]
  name                      = "scaling"
  max_size                  = 2
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 1
  force_delete              = true
  # placement_group           = aws_placement_group.placement_group.id
  launch_configuration = aws_launch_configuration.launchconfig.id
  vpc_zone_identifier  = [aws_subnet.public_subnet.id, aws_subnet.private_subnet.id]

  # launch_template_id = aws_launch_template.alts.id

  initial_lifecycle_hook {
    name                 = "instance"
    default_result       = "CONTINUE"
    heartbeat_timeout    = 200
    lifecycle_transition = "autoscaling:EC2_INSTANCE_LAUNCHING"


  }

}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.aws_vpc.id

  tags = {
    Name = "gateway"
  }
}
resource "aws_alb" "aws_alb" {
  name            = "terraform-alb"
   internal           = false
   load_balancer_type = "application"
  # vpc_id     = aws_vpc.aws_vpc.id
   security_groups = [
    aws_security_group.aws_sg.id
  ]
  subnets         = [aws_subnet.public_subnet.id,aws_subnet.private_subnet.id]
   enable_deletion_protection = true
  # tags {
  #   Name = "terraform-alb"
  # }
}
resource "aws_lb_target_group" "target" {
  name     = "lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.aws_vpc.id
# health_check {
#   enabled =true
#   healthy_threshold =5
#   interval =10
#   matcher =200
#   port ="traffic-port"
#   protocol ="HTTP"
#   timeout =3
#   unhealthy_threshold =2
}
resource "aws_route53_health_check" "health_check" {
  fqdn              = "health.com"
  port              = 80
  type              = "HTTP"
  resource_path     = "/"
  failure_threshold = "5"
  request_interval  = "30"

}