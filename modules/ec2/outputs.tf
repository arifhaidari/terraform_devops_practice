output "ec2_instance_ids" {
  description = "IDs of the EC2 instances"
  value       = aws_autoscaling_group.web_server_asg.instances[*].id
}
