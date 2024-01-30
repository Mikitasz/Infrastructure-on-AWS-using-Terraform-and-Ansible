variable "sg_bastion_id" {}
 
resource "aws_instance" "bastion" {
    ami = "ami-0a3c3a20c09d6f377"
    instance_type = "t2.micro"
    tags = {
    Name = "bastion"
    }
    vpc_security_group_ids = [var.sg_bastion_id]
    key_name = "bastion-key-pair"
}