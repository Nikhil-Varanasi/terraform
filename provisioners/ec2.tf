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

    ingress {
        from_port        = 80
        to_port          = 80
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
    ami = "ami-09c813fb71547fc4f"
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    instance_type = "t3.micro"
    tags = {
        Name = "terraform"
    }
    #in this case my laptop is local
    provisioner "local-exec" {
        command = "echo ${self.private_ip} > public_ip.txt"
    }
    connection {
        type  = "ssh"
        user = "ec2-user"
        password = "DevOps321"
        host = self.public_ip
    }
    
    provisioner "remote-exec" {
        inline = [
            "sudo dnf install ansible -y",
            "sudo dnf install nginx -y",
            "sudo systemctl start nginx"
        ]
    }
    provisioner "remote-exec" {
        when = destroy
        inline = [
            "sudo dnf install ansible -y",
            "sudo dnf install nginx -y",
            "sudo systemctl start nginx"
        ]
    }

}