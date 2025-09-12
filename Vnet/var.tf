variable "vnet_y" {
    type = map(object({
        name                = string
        address_space       = list(string)
        location            = string
        resource_group_name = string
    }))
  
}