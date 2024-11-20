resource "aws_security_group" "allow_ssh_terraform" {
    name        = "Allow-ssh"
    description = "Allow port 22 for ssh access"

    ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    tags = {
    Name = "allow_ssh"
    }

}
resource "aws_instance" "terraform" {
    ami = data.aws_ami.joindevops.id
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    instance_type = "t3.micro"
    tags = {
        Name = "terraform"
    }

}