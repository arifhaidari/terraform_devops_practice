# outputs.tf content for nat_gateway
output "nat_gateway_ids" {
  description = "IDs of the NAT gateways"
  value       = aws_nat_gateway.nat_gateway[*].id
}
