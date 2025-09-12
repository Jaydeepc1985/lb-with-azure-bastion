data "azurerm_nat_gateway" "natgw" {
  name                = "jaydeep-nat-gw"
  resource_group_name = "jaydeep_rg1"
}

data "azurerm_public_ip" "pip" {
  name                = "NAT-public-ip"
  resource_group_name = "jaydeep_rg1"
}