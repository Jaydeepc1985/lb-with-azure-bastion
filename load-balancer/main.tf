resource "azurerm_lb" "frontend_lb" {
    for_each = var.frontend_lb
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = each.value.sku

  dynamic "frontend_ip_configuration" {
    for_each = each.value.frontend_ip_configuration
    content {
      name                 = frontend_ip_configuration.key
      public_ip_address_id = data.azurerm_public_ip.pip.id
    }
  }
}

output "lb_id" {
  value = { for k, v in azurerm_lb.frontend_lb : k => v.id }
  description = "Map of load balancer IDs"
}
