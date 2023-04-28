# ***************************************************************************
# Create public IP address for app load balancer
resource "azurerm_public_ip" "app_lb" {
  name                = "app-lb-ip"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

# Create app load balancer
resource "azurerm_lb" "app" {
  name                = "app-lb"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  frontend_ip_configuration {
    name                 = "app-lb-feip"
    public_ip_address_id = azurerm_public_ip.app_lb.id
  }
}

# Configure app load balancer backend pool
resource "azurerm_lb_backend_address_pool" "app" {
  name                = "app-lb-backend-pool"
  loadbalancer_id     = azurerm_lb.app.id
}

# Configure app load balancer health probe
resource "azurerm_lb_probe" "app" {
  name                = "app-lb-probe"
  resource_group_name = azurerm_resource_group.example.name
  loadbalancer_id     = azurerm_lb.app.id
  protocol            = "tcp"
  port                = 80
}

# Configure app load balancer rule
resource "azurerm_lb_rule" "app" {
  name                           = "app-lb-rule"
  resource_group_name            = azurerm_resource_group.example.name
  loadbalancer_id                = azurerm_lb.app.id
  protocol                       = "tcp"
  frontend_port                  = 80
  backend_port                   = 80
  backend_address_pool_id        = azurerm_lb_backend_address_pool.app.id
  probe_id                       = azurerm_lb_probe.app.id
}

# Associate app virtual machines with app load balancer backend pool
resource "azurerm_lb_backend_address_pool_association" "app" {
  count                        = length(azurerm_windows_virtual_machine.app)
  ip_configuration_id          = element(azurerm_windows_virtual_machine.app.*.network_interface_ids, count.index)[0]
  loadbalancer_backend_address_pool_id = azurerm_lb_backend_address_pool.app.id
}

