#Create Resource Groups
resource "azurerm_resource_group" "rg_app" {
  name     = "rg-app"
  location = var.location
}

resource "azurerm_resource_group" "rg_data" {
  name     = "rg-data"
  location = var.location
}

resource "azurerm_resource_group" "rg_web" {
  name     = "rg-web"
  location = var.location
}
