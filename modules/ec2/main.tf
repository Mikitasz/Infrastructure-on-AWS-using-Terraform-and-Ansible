variable "sg_id" {}
variable "subnet_id" {}

resource "aws_instance" "webserver" {
    ami = "ami-0c7217cdde317cfec"
    instance_type = "t2.micro"
    subnet_id = var.subnet_id
    tags = {
    Name = "Webserver"
    }
    security_groups = [var.sg_id]
    key_name = "web-key-pair"
    
}
output "web_server" {
    value = aws_instance.webserver.private_ip
  
}