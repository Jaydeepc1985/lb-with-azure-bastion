resource "azurerm_subnet_nat_gateway_association" "frontend_nat_assoc" {
    for_each = var.subnet_assoc
  subnet_id      = data.azurerm_subnet.subnet.id
  nat_gateway_id = data.azurerm_nat_gateway.natgw.id
}