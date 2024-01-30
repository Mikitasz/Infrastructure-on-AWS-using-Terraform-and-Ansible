resource "aws_key_pair" "bastion-key-pair" {
key_name = "bastion-key-pair"
public_key = tls_private_key.rsa.public_key_openssh
}
resource "tls_private_key" "rsa" {
algorithm = "RSA"
rsa_bits  = 4096
}
resource "local_file" "bastion-key" {
content  = tls_private_key.rsa.private_key_pem
file_permission = "400"
filename = "bastion-key-pair"
}


resource "aws_key_pair" "web-key-pair" {
key_name = "web-key-pair"
public_key = tls_private_key.rsa.public_key_openssh
}
resource "local_file" "web-key" {
content  = tls_private_key.rsa.private_key_pem
file_permission = "400"
filename = "web-key-pair"
}


resource "aws_key_pair" "nginx-key-pair" {
key_name = "nginx-key-pair"
public_key = tls_private_key.rsa.public_key_openssh
}
resource "local_file" "nginx-key" {
content  = tls_private_key.rsa.private_key_pem
file_permission = "400"
filename = "nginx-key-pair"
}