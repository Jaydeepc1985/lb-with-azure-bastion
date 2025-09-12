variable "nic_config" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    subnet_name         = string
    # public_ip_name      = string
    ip_configuration    = list(object({
      name                          = string
      private_ip_address_allocation = string
    }))
  }))
}
