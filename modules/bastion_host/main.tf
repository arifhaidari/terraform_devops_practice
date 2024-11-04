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
