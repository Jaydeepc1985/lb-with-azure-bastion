variable "pool_assoc" {
  type = map(object({
    network_interface_name  = string
    ip_configuration_name   = string
    resource_group_name     = string
  }))
}