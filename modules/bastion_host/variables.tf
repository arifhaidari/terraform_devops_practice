variable "ami_id" {
  description = "The AMI ID for the Bastion host"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the Bastion host"
  type        = string
  default     = "t2.micro"
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for the Bastion host"
  type        = list(string)
}

variable "bastion_security_group_id" {
  description = "The security group ID for the Bastion host"
  type        = string
}
