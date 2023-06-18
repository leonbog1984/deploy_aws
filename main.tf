provider "aws" {
  region = "eu-north-1"
}

data "aws_ami" "ubuntu_latest" {
  owners      = ["099720109477"]
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

output "data_aws_ami" {
  value = data.aws_ami.ubuntu_latest.id
}

resource "aws_instance" "srv01" {
  ami                    = data.aws_ami.ubuntu_latest.id
  instance_type          = "t2.micro"
}

