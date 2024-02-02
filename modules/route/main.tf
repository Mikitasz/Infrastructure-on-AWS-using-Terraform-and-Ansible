variable "vpc_id" {}
variable "subnet_id" {}
variable "gateway_id" {}
variable "nat_gateway" {

}
variable "private_subnet" {
  
}
variable "default_route_table_id" {
  
}

resource "aws_default_route_table" "example" {
  default_route_table_id = var.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.nat_gateway
  }

 

  tags = {
    Name = "Private-Route-Table"
  }
}

resource "aws_route_table" "second_rt" {
 vpc_id = var.vpc_id

 route {
   cidr_block = "0.0.0.0/0"
   gateway_id = var.gateway_id
   
 }
 
 tags = {
   Name = "Public-Route-table"
 }
}
resource "aws_route_table_association" "public_subnet_asso" {

 subnet_id      = var.subnet_id
 route_table_id = aws_route_table.second_rt.id
}
