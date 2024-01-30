data "http" "myip" {
  url = "https://ipv4.icanhazip.com"
}


resource "aws_security_group" "bastion-sg" {
  name        = "bastion-sg"
  description = "Allow ssh to bastion host"

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
output "sg_bastion_id" {
  value = aws_security_group.bastion-sg.id
}


resource "aws_security_group" "webserver-sg" {
  name        = "webserver-sg"
  description = "Allow all inbound traffic to http web server"

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
    security_groups = [aws_security_group.bastion-sg.id]
   
  }
  
  egress {
      protocol    = -1
      from_port   = 0
      to_port     = 0
      cidr_blocks = ["0.0.0.0/0"]
    }
}
output "sg_web_id" {
  value = aws_security_group.webserver-sg.id
}


resource "aws_security_group" "nginx-lb-sg" {
  name        = "nginx-lb-sg"
  description = "Nginx load balancer"

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
  value = aws_security_group.nginx-lb-sg.id
}


