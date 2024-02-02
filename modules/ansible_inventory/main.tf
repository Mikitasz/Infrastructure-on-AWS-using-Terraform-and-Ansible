
variable "nginx_server" {}
variable "user" {}
variable "web_server" {}
variable "bastion_server" {}
variable "key_web" {
  default = "web-key-pair"
}


variable "key_nginx" {
  default = "nginx-key-pair"
}

variable "key_bastion" {
  default = "bastion-key-pair"
}

resource "local_file" "ansible_inventory" {
  content = templatefile("template.tmpl", {


    nginx_server  =   var.nginx_server 
    web_server = var.web_server
    bastion_server = var.bastion_server
    user     = var.user
    key_web = var.key_web
    key_nginx =var.key_nginx
    key_bastion = var.key_bastion

  })
  filename = "ansible/inventory/hosts"
}