# outputs.tf content for bastion_host
output "bastion_host_instance_ids" {
  description = "IDs of the Bastion host instances"
  value       = aws_instance.bastion_host[*].id
}
