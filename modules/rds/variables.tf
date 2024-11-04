variable "private_subnet_ids" {
  description = "List of private subnet IDs for the RDS"
  type        = list(string)
}

variable "db_instance_type" {
  description = "The instance type for the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "The name of the database"
  type        = string
}

variable "db_username" {
  description = "The master username for the database"
  type        = string
}

variable "db_password" {
  description = "The master password for the database"
  type        = string
  sensitive   = true
}

variable "db_security_group_id" {
  description = "The security group ID for the RDS instance"
  type        = string
}
