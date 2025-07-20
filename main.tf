provider "aws" {
  region = "us-east-1"
}

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
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
