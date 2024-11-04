resource "aws_eip" "nat_gateway" {
  count = length(var.public_subnet_ids)
  vpc   = true
}

resource "aws_nat_gateway" "nat_gateway" {
  count          = length(var.public_subnet_ids)
  allocation_id  = aws_eip.nat_gateway[count.index].id
  subnet_id      = var.public_subnet_ids[count.index]
  depends_on     = [aws_eip.nat_gateway]
}
