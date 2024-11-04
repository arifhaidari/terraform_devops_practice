resource "aws_launch_template" "web_server" {
  name_prefix   = "web-server-"
  image_id      = var.ami_id
  instance_type = var.instance_type

  network_interfaces {
    associate_public_ip_address = false
    subnet_id                   = var.private_subnet_ids[0]  # Attach to the first private subnet
    security_groups             = [var.ec2_security_group_id]
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "web_server_asg" {
  desired_capacity     = 1
  min_size             = var.min_size
  max_size             = var.max_size
  vpc_zone_identifier  = var.private_subnet_ids
  launch_template {
    id      = aws_launch_template.web_server.id
    version = "$Latest"
  }

  health_check_type         = "ELB"
  health_check_grace_period = 300

  tag {
    key                 = "Name"
    value               = "web-server-instance"
    propagate_at_launch = true
  }
}
