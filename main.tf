module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
}

module "subnet" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "nat_gateway" {
  source = "./modules/nat_gateway"
  vpc_id = module.vpc.vpc_id
  public_subnet_ids = module.subnet.public_subnet_ids
}

module "alb" {
  source = "./modules/alb"
  vpc_id = module.vpc.vpc_id
  public_subnet_ids = module.subnet.public_subnet_ids

  # Pass the alb_security_group_id
  alb_security_group_id = aws_security_group.alb_sg.id
}


module "ec2" {
  source              = "./modules/ec2"
  vpc_id              = module.vpc.vpc_id
  private_subnet_ids  = module.subnet.private_subnet_ids
  ami_id              = var.ami_id
  instance_type       = var.instance_type
  min_size            = var.min_size
  max_size            = var.max_size
  ec2_security_group_id = aws_security_group.ec2_sg.id  # Pass the security group ID
}

module "rds" {
  source               = "./modules/rds"
  private_subnet_ids   = module.subnet.private_subnet_ids
  db_instance_type     = var.db_instance_type
  db_name              = var.db_name
  db_username          = var.db_username
  db_password          = var.db_password
  db_security_group_id = aws_security_group.rds_sg.id  # Pass the RDS security group ID
}


module "bastion_host" {
  source              = "./modules/bastion_host"
  public_subnet_ids   = module.subnet.public_subnet_ids
  bastion_security_group_id = aws_security_group.bastion_sg.id  # Pass the security group ID
  ami_id              = var.ami_id
  instance_type       = var.bastion_instance_type
}
