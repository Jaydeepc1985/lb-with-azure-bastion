
data "azurerm_subnet" "subnets" {
  for_each = var.nic_config

  name                 = each.value.subnet_name
  virtual_network_name = "JaydeepVnet"
  resource_group_name  = each.value.resource_group_name
}

# data "azurerm_public_ip" "ips" {
#   for_each = var.nic_config

#   name                = each.value.public_ip_name
#   resource_group_name = each.value.resource_group_name
# }
