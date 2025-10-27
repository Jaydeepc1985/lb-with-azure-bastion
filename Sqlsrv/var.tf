variable "sql-server" {
    description = "Map of SQL Server configurations"
    type        = map(object({
        name                         = string
        resource_group_name          = string
        location                     = string
        version                      = string
        administrator_login          = string
        administrator_login_password = string
        minimum_tls_version          = string
        tags                         = map(string)
    }))
  
}
