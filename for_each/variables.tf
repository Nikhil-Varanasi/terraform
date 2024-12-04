variable "instance" {
    type = map
    default = {
        mysql = "t3.small"
        backend = "t3.micro"
        frontend = "t3.micro"
    }
}

variable "domain_name" {
  default = "nikhilvaranasi.online"
}
variable "zone_id" {
  default = "Z06638764WSB8DJ5XHCK"
}