output "alb_arn" {
  description = "ARN of the Application Load Balancer"
  value       = aws_lb.application_load_balancer.arn
}

output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.application_load_balancer.dns_name
}
