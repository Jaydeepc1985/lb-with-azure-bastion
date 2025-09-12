data "azurerm_lb" "lb" {
    name                = "jaydeep-frontend-lb-1"
    resource_group_name = "jaydeep_rg1"
}

resource "azurerm_lb_backend_address_pool" "frontend_lb_pool" {
    for_each = var.backend_pool
  loadbalancer_id = data.azurerm_lb.lb.id
  name            = each.value.name
}

output "backend_pool_id" {
  value = { for k, v in azurerm_lb_backend_address_pool.frontend_lb_pool : k => v.id }
  description = "Map of backend pool IDs"
}