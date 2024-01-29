resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow all inbound traffic to http"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
output "sg_id" {
  value = aws_security_group.allow_http.id
}