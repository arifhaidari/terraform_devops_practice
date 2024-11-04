# variables.tf content for rds
variable "db_instance_class" {
  description = "Class of the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "Name of the database"
  type        = string
}

variable "db_username" {
  description = "Username for the database"
  type        = string
}

variable "db_password" {
  description = "Password for the database"
  type        = string
  sensitive   = true
}

variable "db_subnet_ids" {
  description = "List of private subnet IDs for the RDS instance"
  type        = list(string)
}
