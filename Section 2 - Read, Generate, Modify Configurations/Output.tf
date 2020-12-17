provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAVXD7RUDPZ5GODUJB"
  secret_key = "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"
}

resource "aws_eip" "lb1" {
  vpc = true
}

output "eip" {
  value = aws_eip.lb1.public_ip
}

resource "aws_s3_bucket" "mys31" {
  bucket = "nm-attribute-demo1"
}

output "mys3bucket" {
  value = aws_s3_bucket.mys31.bucket_domain_name
}
