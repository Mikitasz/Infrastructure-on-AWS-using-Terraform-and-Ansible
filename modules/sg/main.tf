data "http" "myip" {
  url = "https://ipv4.icanhazip.com"
}
variable "vpc_id" {}

resource "aws_security_group" "bastion_server" {
  name        = "bastion_server"
  description = "Allow ssh to bastion_server"
  vpc_id = var.vpc_id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  }

egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
output "sg_public_subnet_id" {
  value = aws_security_group.bastion_server.id
}

resource "aws_security_group" "nginx_server" {
  name        = "nginx_server"
  description = "Nginx load balancer"
  vpc_id = var.vpc_id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    #security_groups = [aws_asecurity_group.bastion-sg.id]
    cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  }
  egress {
      protocol    = -1
      from_port   = 0
      to_port     = 0
      cidr_blocks = ["0.0.0.0/0"]
    }
}
output "sg_nginx_id" {
  value = aws_security_group.nginx_server.id
}


resource "aws_security_group" "web_server" {
  name        = "web_server"
  description = "Allow all ssh and http to web_server"
  vpc_id = var.vpc_id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.nginx_server.id]
  }
   ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.bastion_server.id]
   
  }
  
  egress {
      protocol    = -1
      from_port   = 0
      to_port     = 0
      cidr_blocks = ["0.0.0.0/0"]
    }
}
output "sg_private_subnet_id" {
  value = aws_security_group.web_server.id
}



