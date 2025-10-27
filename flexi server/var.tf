variable "flexi_server" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    administrator_login = string
    administrator_password = string
    sku                 = string
    version             = string
    tags               = map(string)
  }))
  
}