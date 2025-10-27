resource "azurerm_mssql_server" "sqldbserver" {
    for_each                     = var.sql-server
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
  minimum_tls_version          = each.value.minimum_tls_version


  tags = {
    environment = each.value.tags["environment"]
  }
}
