data "azurerm_mssql_server" "sql" {
        name     = "jaydeep-sql-server"
    resource_group_name = "jaydeep_rg1"

  
}


resource "azurerm_mssql_database" "Sqldatabase" {
  for_each     = var.sql-database
  name         = each.value.name
  server_id    = data.azurerm_mssql_server.sql.id
  max_size_gb  = each.value.max_size_gb
  sku_name     = each.value.sku_name
  enclave_type = each.value.enclave_type

  tags = {
    environment = each.value.tags["environment"]
    project     = each.value.tags["project"]
  }
}