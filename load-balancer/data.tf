data "azurerm_public_ip" "pip" {
  name                = "lb-public-ip"
  resource_group_name = "jaydeep_rg1"
}