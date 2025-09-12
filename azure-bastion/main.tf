resource "azurerm_bastion_host" "example" {
    for_each = var.bastion-host
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  # address_prefixes     = each.value.address_prefixes

  dynamic "ip_configuration" {
    for_each = each.value.ip_configuration
    content {
      name                 = ip_configuration.value.name
      subnet_id            = data.azurerm_subnet.subnets.id
      public_ip_address_id = data.azurerm_public_ip.ips.id
    }
  }
}