provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAVXD7RUDPZ5GODUJB"
  secret_key = "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"
}

resource "aws_security_group" "allow_tls" {
  name = "nm_security_group"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${var.vpn_ip}/32"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.vpn_ip}/32"]
  }
}
