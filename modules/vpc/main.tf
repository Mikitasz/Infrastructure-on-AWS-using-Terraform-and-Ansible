resource "aws_vpc" "vpc" {
  cidr_block = "172.16.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "VPC-terraform"
  }
}
output "vpc_id" {
    value = aws_vpc.vpc.id
  
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "172.16.1.0/24"

  tags = {
    Name = "public_subnet-terraform"
  }
  
}
output "public_subnet_id" {
value = aws_subnet.public_subnet.id
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "172.16.2.0/24"

  tags = {
    Name = "private_subnet-terraform"
  }
}
output "private_subnet_id" {
value = aws_subnet.private_subnet.id
}

resource "aws_internet_gateway" "terraform-internet-gateway" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "terraform VPC IG"
  }
}

resource "aws_route_table" "second_rt" {
 vpc_id = aws_vpc.vpc.id
 
 route {
   cidr_block = "0.0.0.0/0"
   gateway_id = aws_internet_gateway.terraform-internet-gateway.id
 }
 
 tags = {
   Name = "2nd Route Table"
 }
}
resource "aws_route_table_association" "public_subnet_asso" {
 
 subnet_id      = aws_subnet.public_subnet.id
 route_table_id = aws_route_table.second_rt.id
}