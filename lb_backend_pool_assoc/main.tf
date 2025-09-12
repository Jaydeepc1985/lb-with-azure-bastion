resource "azurerm_network_interface_backend_address_pool_association" "frontend_assoc" {
  for_each                = var.pool_assoc
  network_interface_id     = data.azurerm_network_interface.net_front[each.key].id
  ip_configuration_name    = each.value.ip_configuration_name   # NIC ke andar jo ip_configuration ka naam hai
  backend_address_pool_id  = data.azurerm_lb_backend_address_pool.pool.id
}

