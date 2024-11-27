resource "aws_instance" "terraform" {
    count = length(var.instance_names)
    ami = data.aws_ami.ami_info.id
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    instance_type = "t3.micro"
    tags = merge(
        var.common_tags,
        {
            Name = var.instance_names[count.index]
        }
    )    
}
