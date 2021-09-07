resource "azurerm_linux_virtual_machine" "training" {
  name                = "training-machine"
  resource_group_name = var.rg.name
  location            = var.rg.location
  size                = "Standard_B1s"
  admin_username      = "training"
  admin_password      = "pw4TrainingVM"

  disable_password_authentication = false

  network_interface_ids = [
    var.nic_id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}