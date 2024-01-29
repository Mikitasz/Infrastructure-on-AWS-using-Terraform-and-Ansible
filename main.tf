variable "secret_key" {} 
variable "access_key" {} 




provider "aws" {
    region = "us-east-1"
    access_key = var.access_key
    secret_key = var.secret_key
}


module "sg" {
    source = "./modules/sg"
}


module "ec2-host" { 
	source     = "./modules/ec2" 
    sg_id =  module.sg.sg_id
}
