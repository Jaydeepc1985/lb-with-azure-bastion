variable "subnet_assoc" {
  type = map(object({
    subnet_name         = string
    subnet_rg           = string
    vnet_name           = string
    nat_gateway_name    = string
    nat_gateway_rg      = string
  }))
}