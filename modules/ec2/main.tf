# main.tf content for ec2
resource "aws_launch_configuration" "wordpress" {
  image_id          = var.ami_id
  instance_type     = "t2.micro"
  security_groups   = [var.security_group_id]
  user_data         = file("scripts/install_wordpress.sh")
}

resource "aws_autoscaling_group" "wordpress_asg" {
  desired_capacity     = 1
  max_size             = 2
  min_size             = 1
  launch_configuration = aws_launch_configuration.wordpress.id
  vpc_zone_identifier  = var.subnet_ids
}
