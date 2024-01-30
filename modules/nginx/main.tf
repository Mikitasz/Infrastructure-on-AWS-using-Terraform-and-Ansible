variable "sg_id" {}

resource "aws_instance" "nginx" {
    ami = "ami-0a3c3a20c09d6f377"
    instance_type = "t2.micro"

    tags = {
    Name = "Nginx"
    }
    vpc_security_group_ids = [var.sg_id]
    key_name = "nginx-key-pair"
}