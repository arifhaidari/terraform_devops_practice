# main.tf content for rds
resource "aws_db_instance" "wordpress_db" {
  allocated_storage    = 20
  db_instance_class    = "db.t3.micro"
  engine               = "mysql"
  engine_version       = "8.0"
  name                 = var.db_name
  username             = var.db_username
  password             = var.db_password
  subnet_group_name    = var.db_subnet_group
  multi_az             = true
  skip_final_snapshot  = true
}
