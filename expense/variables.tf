variable "instance_names" {
    type = list(string)
    default = ["mysql","backend","frontend"]
}

#functions
variable "common_tags" {
    type = map
    default = {
        project = "expense"
        Environment = "dev"
        Terraform = "true"
    }
}

variable "zone_id" {
    default = "Z06638764WSB8DJ5XHCK"
}
variable "domain_name" {
    default = "nikhilvaranasi.online"
}