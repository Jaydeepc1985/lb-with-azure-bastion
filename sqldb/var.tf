variable "sql-database" {
    description = "Map of SQL Database configurations"
    type        = map(object({
        name         = string
        server_id    = string
        max_size_gb  = number
        sku_name     = string
        enclave_type = string
        tags         = map(string)
    }))
}