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
  map_public_ip_on_launch = true  
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