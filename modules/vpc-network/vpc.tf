resource "aws_vpc" "appvpc" {
  cidr_block = var.vpc_cidr
}


# igw
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.appvpc.id
}
