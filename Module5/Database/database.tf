

resource "azurerm_storage_account" "sa1" {
  name                     = var.sa
  resource_group_name      =var.rgName # azurerm_resource_group.example.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
   tags = local.tags
}

resource "azurerm_mssql_server" "mysqlserver1" {
  name                         = var.mysqlserver  
   resource_group_name         = var.rgName # azurerm_resource_group.example.name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
   tags = local.tags
}

resource "azurerm_mssql_database" "mysqlDatabase1" {
  name           = var.mysqlDatabase
  server_id      = azurerm_mssql_server.mysqlserver1.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 2
  read_scale     = false
  sku_name       = "S0"
  zone_redundant = false
  enclave_type   = "VBS"
  tags = local.tags

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = false
  }
}







/*resource "azurerm_mysql_server" "sa1" {
  name                = var.sa # "sa for mysqlserver1"
  location            = var.location
  resource_group_name = var.rgName

  administrator_login          = "mysqladminun"
  administrator_login_password = "H@Sh1CoR3!"

  sku_name   = "GP_Gen5_2"
  storage_mb = 5120
  version    = "5.7"


  auto_grow_enabled                 = false
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = false
  infrastructure_encryption_enabled = true
  public_network_access_enabled     = false
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"
}

resource "azurerm_mysql_database" "mysqlDatabase" {
  name                = var.mysqlDatabase1 #"exampledb"
 

  resource_group_name = var.rgName
  server_name       = var.sa
  
  charset             = "utf8"
  collation           = "utf8_unicode_ci"

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = false
  }
}
*/