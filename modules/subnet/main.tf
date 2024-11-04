# main.tf content for subnet
resource "aws_subnet" "public_subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.public_cidr_block
  availability_zone = var.availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.subnet_name}-public"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_cidr_block
  availability_zone = var.availability_zone
  tags = {
    Name = "${var.subnet_name}-private"
  }
}
