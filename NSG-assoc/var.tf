variable "nsg_assoc" {
  type = map(object({
    subnet_name         = string
    nsg_name            = string
    resource_group_name = string
    vnet_name           = string
  }))
}