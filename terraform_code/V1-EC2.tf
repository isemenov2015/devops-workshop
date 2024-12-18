provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "demo-server" {
  ami = "ami-0453ec754f44f9a4a"
  instance_type = "t2.micro"
  key_name = "dpp-terraform"
  security_groups = [ "demo-sg" ]
}

resource "aws_security_group" "demo-sg" {
  name        = "demo-sg"
  description = "SSH Access"

  ingress = [ {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
    prefix_list_ids = []
    security_groups = []
    self = false  } ]

  egress = [{
    description = "SSH access"
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
    prefix_list_ids = []
    security_groups = []
    self = false
  } ]

  tags = {
    Name = "ssh-port"
  }
}
