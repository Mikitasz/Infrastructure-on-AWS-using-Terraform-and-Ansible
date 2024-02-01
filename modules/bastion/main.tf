variable "sg_bastion_id" {}
variable "subnet_id" {}
resource "aws_instance" "bastion" {
    ami = "ami-0c7217cdde317cfec"
    instance_type = "t2.micro"
    subnet_id = var.subnet_id
    tags = {
    Name = "Bastion"
    }
    security_groups = [var.sg_bastion_id]
    key_name = "bastion-key-pair"
    associate_public_ip_address = true
}