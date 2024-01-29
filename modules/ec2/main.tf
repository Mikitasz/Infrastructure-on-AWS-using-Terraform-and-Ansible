variable "sg_id" {}
 
resource "aws_instance" "webserver" {
    ami = "ami-0a3c3a20c09d6f377"
    instance_type = "t2.micro"
    tags = {
    name = "webserver"
    }
    vpc_security_group_ids = [var.sg_id]
}