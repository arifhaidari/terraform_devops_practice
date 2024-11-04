# variables.tf content for bastion_host
variable "ami_id" {
  description = "AMI ID for the Bastion host"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the Bastion host"
  type        = string
  default     = "t2.micro"
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for the Bastion host"
  type        = list(string)
}

variable "key_pair_name" {
  description = "Key pair name for SSH access"
  type        = string
}
