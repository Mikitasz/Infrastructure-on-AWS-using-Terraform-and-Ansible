variable "vpc_id" {}

resource "aws_internet_gateway" "terraform-internet-gateway" {
  vpc_id = var.vpc_id
  tags = {
    Name = "terraform VPC IG"
  }
}
output "IG_id" {
  value = aws_internet_gateway.terraform-internet-gateway.id
}