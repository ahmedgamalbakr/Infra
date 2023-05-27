resource "aws_eip" "nat_gateway" {
  domain      = "vpc"

}
resource "aws_nat_gateway" "workers_nat" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id     = aws_subnet.public_1.id

}