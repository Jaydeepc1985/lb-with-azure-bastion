variable "natgw_assoc" {
  description = "Map of NAT Gateway and Public IP associations"
  type = map(object({
    nat_gateway_name     = string
    natgw_rg             = string
    public_ip_name       = string
    public_ip_rg         = string
  }))
}