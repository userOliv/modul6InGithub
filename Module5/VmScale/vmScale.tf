resource "azurerm_windows_virtual_machine_scale_set" "vmss1" {
  name                 = var.vmss1
  resource_group_name  = var.rgName
  location             = var.location
  sku                  = "Standard_F2"
  instances            = 2 #antall vm i vm scale sett å starte med
  admin_password       = "P@55w0rd1234!"
  admin_username       = "adminuser"
  computer_name_prefix = "vm-"
   tags = local.tags

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter-Server-Core"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "nic-vmss" # fritt oppgitt interface navn vmss skal bruke på nettet.
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = var.subnet_id
    }
  }
}