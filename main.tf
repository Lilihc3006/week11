provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "bad_example" {
  name        = "allow_all"
  description = "Test inbound traffic - tfsec validation"
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
