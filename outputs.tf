output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "The IDs of public subnets"
  value       = module.subnet.public_subnet_ids
}

output "private_subnet_ids" {
  description = "The IDs of private subnets"
  value       = module.subnet.private_subnet_ids
}

output "alb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = module.alb.alb_dns_name
}

output "rds_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = module.rds.rds_endpoint
}
