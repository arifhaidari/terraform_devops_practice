resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = var.az
  size = var.volume_size
  tags = {
    Name = var.ebs_name
  }
}

