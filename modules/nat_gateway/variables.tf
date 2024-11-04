# variables.tf content for nat_gateway
variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "elastic_ip_count" {
  description = "Number of Elastic IPs needed"
  type        = number
  default     = 2
}
