resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "DB Subnet Group"
  }
}

resource "aws_db_instance" "rds_instance" {
  identifier              = var.db_name
  allocated_storage       = 20
  storage_type            = "gp2"
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = var.db_instance_type
  name                    = var.db_name
  username                = var.db_username
  password                = var.db_password
  db_subnet_group_name    = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids  = [var.db_security_group_id]
  skip_final_snapshot     = true
  multi_az                = true
  publicly_accessible     = false

  tags = {
    Name = "RDS Instance"
  }
}
