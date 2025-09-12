variable "lb_rules" {
  type = map(object({
    name                           = string
    protocol                       = string
    frontend_port                  = number
    backend_port                   = number
    frontend_ip_configuration_name = string
    backend_pool_key               = string  # <-- old backend_address_pool_id hata do
    probe_key                      = string  # <-- old probe_id hata do
  }))
}

variable "backend_pools" {
  type = map(object({
    backend_pool_id = string
  }))
}

variable "probes" {
  type = map(object({
    probe_id = string
  }))
}

variable "loadbalancer_id" {
  type = string
}
