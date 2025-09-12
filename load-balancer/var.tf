variable "frontend_lb" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    sku                 = string
    frontend_ip_configuration = map(object({
      name                 = string
    }))
  }))
}

