
resource "aws_subnet" "public_1" {
  vpc_id = aws_vpc.main.id

  cidr_block = var.PUBLIC_SUBNET1

  map_public_ip_on_launch = true
  
  availability_zone = var.AZ_1




}

resource "aws_subnet" "private_1" {
  vpc_id = aws_vpc.main.id

  cidr_block = var.PRIVATE_SUBNET1

  availability_zone = var.AZ_1


}

resource "aws_subnet" "private_2" {
  vpc_id = aws_vpc.main.id

  cidr_block = var.PRIVATE_SUBNET2

  availability_zone = var.AZ_2



}