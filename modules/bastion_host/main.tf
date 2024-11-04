# main.tf content for bastion_host
resource "aws_instance" "bastion" {
  ami           = var.bastion_ami_id
  instance_type = "t2.micro"
  subnet_id     = var.public_subnet_id
  key_name      = var.key_name
  tags = {
    Name = "Bastion Host"
  }
}
