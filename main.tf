variable "secret_key" {} 
variable "access_key" {} 




provider "aws" {
    region = "us-east-1"
    access_key = var.access_key
    secret_key = var.secret_key
}

module "vpc" {
    source = "./modules/vpc"
  
}
module "sg" {
    source = "./modules/sg"
    vpc_id= module.vpc.vpc_id
}
module "key_pair" { 
	source     = "./modules/create key-pair" 
   
}
module "bastion-host" { 
	source     = "./modules/bastion" 
    sg_bastion_id =  module.sg.sg_public_subnet_id
    subnet_id = module.vpc.public_subnet_id
}

module "ec2-host" { 
	source     = "./modules/ec2" 
    sg_id =  module.sg.sg_private_subnet_id
    subnet_id = module.vpc.private_subnet_id
}

module "nginx" { 
	source     = "./modules/nginx" 
    sg_id =  module.sg.sg_nginx_id
    subnet_id = module.vpc.public_subnet_id
}