resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.custom.id

  tags = {
    Name = "custom-igw"
  }
}
