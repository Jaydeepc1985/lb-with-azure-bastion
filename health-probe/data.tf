data "azurerm_lb" "lb" {
    name                = "jaydeep-frontend-lb-1"
    resource_group_name = "jaydeep_rg1"
}