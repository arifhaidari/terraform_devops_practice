# variables.tf content for ec2
variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "Type of instance to launch"
  type        = string
  default     = "t2.micro"
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for instances"
  type        = list(string)
}

variable "key_pair_name" {
  description = "Key pair name for SSH access"
  type        = string
}
