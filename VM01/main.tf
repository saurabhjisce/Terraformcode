
resource "azurerm_windows_virtual_machine" "rgvm01" {
  for_each = var.azrdatavm01
  name                = each.value.name
  resource_group_name = data.azurerm_resource_group.rgdata01.name
  location            = data.azurerm_resource_group.rgdata01.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [data.azurerm_network_interface.azrnicdata01[each.key].id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}