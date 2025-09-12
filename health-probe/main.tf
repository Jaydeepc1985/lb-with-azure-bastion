resource "azurerm_lb_probe" "frontend_probe" {
    for_each = var.probes
  loadbalancer_id = data.azurerm_lb.lb.id
  name            = each.value.name
  port            = each.value.port
  protocol        = each.value.protocol
}

output "probe_id" {
  value = { for k, v in azurerm_lb_probe.frontend_probe : k => v.id }
  description = "Map of probe IDs"
}