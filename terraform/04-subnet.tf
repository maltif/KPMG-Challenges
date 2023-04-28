# Create Subnets
resource "azurerm_subnet" "subnet_app" {
  name                 = "subnet-app"
  address_prefixes     = ["10.0.1.0/24"]
  virtual_network_name = azurerm_virtual_network.vn_app.name
  resource_group_name  = azurerm_resource_group.rg_app.name
}

resource "azurerm_subnet" "subnet_data" {
  name                 = "subnet-data"
  address_prefixes     = ["10.1.1.0/24"]
  virtual_network_name = azurerm_virtual_network.vn_data.name
  resource_group_name  = azurerm_resource_group.rg_data.name
}

resource "azurerm_subnet" "subnet_web" {
  name                 = "subnet-web"
  address_prefixes     = ["10.2.1.0/24"]
  virtual_network_name = azurerm_virtual_network.vn_web.name
  resource_group_name  = azurerm_resource_group.rg_web.name
}
