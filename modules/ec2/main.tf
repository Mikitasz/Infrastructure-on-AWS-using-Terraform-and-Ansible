variable "sg_id" {}
variable "subnet_id" {}

resource "aws_instance" "webserver" {
    ami = "ami-0a3c3a20c09d6f377"
    instance_type = "t2.micro"
    subnet_id = var.subnet_id
    tags = {
    Name = "webserver"
    }
    vpc_security_group_ids = [var.sg_id]
    key_name = "web-key-pair"
}