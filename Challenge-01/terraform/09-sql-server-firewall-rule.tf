# Create SQL Server Firewall Rule
resource "azurerm_sql_firewall_rule" "sql_app_subnet" {
  name                = "sql-server-rule"
  resource_group_name = azurerm_resource_group.example.name
  server_name         = azurerm_sql_server.data.name
  start_ip_address    = azurerm_subnet.app_tier.address_prefixes[0]
  end_ip_address      = azurerm_subnet.app_tier.address_prefixes[0]
}
