data "aws_ami" "ami_info" {
  most_recent = true
  owners      = ["97371446881"]

  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-practice"]
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