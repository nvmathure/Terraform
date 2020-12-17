provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAVXD7RUDPZ5GODUJB"
  secret_key = "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"
}

resource "aws_instance" "myec22" {
  ami           = "ami-04bf6dcdc9ab498ca"
  instance_type = "t2.micro"
}


resource "aws_eip" "lb1" {
  vpc = true
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.myec22.id
  allocation_id = aws_eip.lb1.id

}

resource "aws_security_group" "allow_tls" {
  name        = "nm_security_group"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.lb1.public_ip}/32"]
  }
}
