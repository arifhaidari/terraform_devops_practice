# resource "aws_eip" "nat_gateway" {
#   count = length(var.public_subnet_ids)
#   vpc   = true
# }

# The vpc = true argument in the aws_eip resource is deprecated. 
# You should replace it with the domain attribute.

resource "aws_eip" "nat_gateway" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat_gateway" {
  count          = length(var.public_subnet_ids)
  allocation_id  = aws_eip.nat_gateway[count.index].id
  subnet_id      = var.public_subnet_ids[count.index]
  depends_on     = [aws_eip.nat_gateway]
}
