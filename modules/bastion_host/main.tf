# Create a security group for the bastion host
resource "aws_security_group" "bastion_sg" {
  name_prefix = "bastion-sg-"
  description = "Security group for the Bastion Host"
  vpc_id      = module.vpc.vpc_id

  # Allow SSH access from a specific IP or range
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Replace with your IP range or 0.0.0.0/0 for open access
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bastion-sg"
  }
}


# ==============

resource "aws_instance" "bastion" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_ids[0] # Place in the first public subnet
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.bastion_security_group_id]

  tags = {
    Name = "Bastion Host"
  }
}
