variable "secret_key" {}
variable "access_key" {}




provider "aws" {
  region     = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

module "vpc" {
  source = "./modules/vpc"

}
module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
}
module "key_pair" {
  source = "./modules/create key-pair"

}
module "bastion-host" {
  source        = "./modules/bastion"
  sg_bastion_id = module.sg.sg_public_subnet_id
  subnet_id     = module.vpc.public_subnet_id
}

module "web_server" {
  source    = "./modules/ec2"
  sg_id     = module.sg.sg_private_subnet_id
  subnet_id = module.vpc.private_subnet_id
}

module "nginx" {
  source    = "./modules/nginx"
  sg_id     = module.sg.sg_nginx_id
  subnet_id = module.vpc.public_subnet_id
}


module "IG" {
  source = "./modules/internet_gateway"
  vpc_id = module.vpc.vpc_id
}

module "route" {
  source                 = "./modules/route"
  vpc_id                 = module.vpc.vpc_id
  subnet_id              = module.vpc.public_subnet_id
  gateway_id             = module.IG.IG_id
  nat_gateway            = module.nat.nat_gateway
  private_subnet         = module.vpc.private_subnet_id
  default_route_table_id = module.vpc.default_route_table_id
}
module "nat" {
  source        = "./modules/NAT"
  public_subnet = module.vpc.public_subnet_id
}

module "ansible_inventory" {
  source         = "./modules/ansible_inventory"
  nginx_server   = module.nginx.public_ip
  web_server     = module.web_server.web_server
  bastion_server = module.bastion-host.bastion_server
  user           = var.user
}