#Create Virtual Networks
resource "azurerm_virtual_network" "vn_app" {
    name                = "vn-app"
    address_space       = ["10.0.0.0/16"]
    location            = var.location
    resource_group_name = azurerm_resource_group.rg_app.name
  
    tags = {
      environment = var.environment
    }
  }
  
  resource "azurerm_virtual_network" "vn_data" {
    name                = "vn-data"
    address_space       = ["10.1.0.0/16"]
    location            = var.location
    resource_group_name = azurerm_resource_group.rg_data.name
  
    tags = {
      environment = var.environment
    }
  }
  
  resource "azurerm_virtual_network" "vn_web" {
    name                = "vn-web"
    address_space       = ["10.2.0.0/16"]
    location            = var.location
    resource_group_name = azurerm_resource_group.rg_web.name
  
    tags = {
      environment = var.environment
    }
  }
