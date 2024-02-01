variable "sg_id" {}
variable "subnet_id" {}

resource "aws_instance" "nginx" {
    ami = "ami-0a3c3a20c09d6f377"
    instance_type = "t2.micro"
    subnet_id = var.subnet_id
    tags = {
    Name = "Nginx"
    }
    security_groups = [var.sg_id]
    key_name = "nginx-key-pair"
    associate_public_ip_address = true
}