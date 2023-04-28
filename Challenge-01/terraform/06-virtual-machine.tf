# Provision app tier virtual machine
resource "azurerm_windows_virtual_machine" "app" {
  name                = "app-vm"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  network_interface_ids = [
    azurerm_network_interface.app.id
  ]
  size                = "Standard_B2ms"
  admin_username      = var.admin_username
  admin_password      = var.admin_password

  # Install required software using custom script extension
  os_profile {
    custom_data = base64encode(data.template_file.app_cloud_init.rendered)
  }

  # Open required ports using network security group
  os_profile_windows_config {
    disable_password_authentication = false
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'deployment script'"
    ]
  }
}
