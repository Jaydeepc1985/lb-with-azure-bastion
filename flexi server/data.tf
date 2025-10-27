data "azurerm_key_vault_secret" "db-login" {
  name                = "db-login1"
  key_vault_id        = data.azurerm_key_vault.kvi.id
}
data "azurerm_key_vault_secret" "db-pass" {
  name                = "admin-pass"
  key_vault_id        = data.azurerm_key_vault.kvi.id
}
data "azurerm_key_vault" "kvi" {
  name                = "jaydeep-key-vault"
  resource_group_name = "jaydeep_rg"
}