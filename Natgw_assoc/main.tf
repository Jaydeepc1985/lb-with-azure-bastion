resource "azurerm_nat_gateway_public_ip_association" "natgw_assoc" {
    for_each = var.natgw_assoc
  nat_gateway_id       = data.azurerm_nat_gateway.natgw.id
  public_ip_address_id = data.azurerm_public_ip.pip.id
  
}