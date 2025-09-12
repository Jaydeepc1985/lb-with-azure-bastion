data "azurerm_network_interface" "net_front" {
  for_each = var.pool_assoc

  name                = each.value.network_interface_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_lb_backend_address_pool" "pool" {
  name            = "frontend-backend-pool"
  loadbalancer_id = data.azurerm_lb.lb.id
}

data "azurerm_lb" "lb" {
    name                = "jaydeep-frontend-lb-1"
    resource_group_name = "jaydeep_rg1"
}