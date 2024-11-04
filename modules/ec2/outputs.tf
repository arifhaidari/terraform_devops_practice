# outputs.tf content for ec2
output "web_server_instance_ids" {
  description = "IDs of the EC2 instances running the web servers"
  value       = aws_instance.web_server[*].id
}
