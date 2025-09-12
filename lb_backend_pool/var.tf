variable "backend_pool" {
  type = map(object({
    name                = string
    loadbalancer_id     = string
  }))
}