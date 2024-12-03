locals {
    domain_name = "nikhilvaranasi.online"
    zone_id = "Z06638764WSB8DJ5XHCK"
    #count.index will not work in locals
    instance_type = var.environment == "prod" ? "t3.medium" : "t3.micro"
}