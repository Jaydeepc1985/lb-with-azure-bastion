variable "bastion-host" {
  type = map(object({
    name                 = string
    location             = string
    resource_group_name  = string
    virtual_network_name = string
    ip_configuration = map(object({
      name = string
    }))

  }))
  
}