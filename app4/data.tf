data "aws_instance" "demo" {
  instance_id = "i-08cbad27cc18e4e38"
}

data "aws_ami" "ami1" {
  most_recent      = true
 
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm*-x86_64-ebs"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}