variable "instance_names" {
  type        = list(string)
  default     = ["mysql", "backend", "frontend"]
  description = "description"
}

variable "domain_name" {
  default = "nikhilvaranasi.online"
}

variable "zone_id" {
  default = "Z06638764WSB8DJ5XHCK"
}