provider "aws" {
  region = "us-east-1"
}

# Dummy change to trigger tfsec

resource "aws_security_group" "secure_example" {
  name        = "allow_internal_http"
  description = "Security group for internal HTTP access"

  ingress {
    description = "Allow HTTP from internal network"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["192.168.1.0/24"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    description = "Allow egress only to internal network"
    cidr_blocks = ["10.0.0.0/16"]
  }
}
resource "aws_security_group" "insecure_sg" {
  name        = "allow_all"
  description = "Allow all inbound traffic - Insecure"
  vpc_id      = "vpc-12345678"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
