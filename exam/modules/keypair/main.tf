resource "aws_key_pair" "name" {
  key_name = var.key_name
  public_key = tls_private_key.name.public_key_openssh
}

resource "tls_private_key" "name" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "local_file" "name" {
  filename = "./script/${var.key_name}.pem"
  content = tls_private_key.name.private_key_pem
  file_permission = "0400"
}