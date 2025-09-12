resource "azurerm_subnet_network_security_group_association" "subnet_assoc" {
    for_each = var.nsg_assoc
  subnet_id                 = data.azurerm_subnet.subnets[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg[each.key].id
}