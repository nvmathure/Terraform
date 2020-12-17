provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAVXD7RUDPZ5GODUJB"
  secret_key = "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"
  version    = "~> 2.0"
}

resource "aws_instance" "myec22" {
  ami           = "ami-04bf6dcdc9ab498ca"
  instance_type = "t2.nano"
}
