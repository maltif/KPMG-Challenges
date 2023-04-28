# Create SQL Server
resource "azurerm_sql_server" "data" {
  name                         = "data-sql-server"
  location                     = azurerm_resource_group.example.location
  resource_group_name          = azurerm_resource_group.example.name
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "Password1234!"
}

# Create SQL Database
resource "azurerm_sql_database" "data" {
  name                = "data-db"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  server_name         = azurerm_sql_server.data.name
  edition             = "Standard"
  collation           = "SQL_Latin1_General_CP1_CI_AS"
  max_size_gb         = 5
  requested_service_objective_name = "S0"
}

