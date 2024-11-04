output "public_subnet_ids" {
  description = "The IDs of public subnets"
  value       = aws_subnet.public_subnets[*].id
}

output "private_subnet_ids" {
  description = "The IDs of private subnets"
  value       = aws_subnet.private_subnets[*].id
}
