variable "public_subnet" {}
resource "aws_eip" "nat_gateway" {
  vpc = true
}


resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id = var.public_subnet
  tags = {
    "Name" = "NatGateway-terraform"
  }
}
output "nat_gateway" {
  value = aws_nat_gateway.nat_gateway.id
}