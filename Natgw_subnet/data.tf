data "azurerm_subnet" "subnet" {
  name                 = "frontend_jay"
  virtual_network_name = "JaydeepVnet"
  resource_group_name  = "jaydeep_rg1"
}
data "azurerm_nat_gateway" "natgw" {
  name                = "jaydeep-nat-gw"
  resource_group_name = "jaydeep_rg1"
}