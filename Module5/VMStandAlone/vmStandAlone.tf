
resource "azurerm_public_ip" "publicIp" {
  name                = var.publicIpName
  resource_group_name = var.rgName
  location            = var.location
  allocation_method   = "Static"


  tags = local.tags
}


resource "azurerm_network_interface" "FirstInterface" {
  name                = var.interfaceName
  location            = var.location
  resource_group_name = var.rgName
   tags = local.tags

  ip_configuration {
    name                          ="public"   # "internal" 
    subnet_id                     =var.subnet1_id
    private_ip_address_allocation ="Dynamic" # "Static" eller "Dynamic" eller ip adresse for static
    public_ip_address_id= azurerm_public_ip.publicIp.id # kobler ip id og dermed adresse til interface som i sin tur er koblet VM.
  }
 
  }


  


resource "azurerm_windows_virtual_machine" "VMachine" {
  name                = var.vmName
  resource_group_name = var.rgName
  location            = var.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [azurerm_network_interface.FirstInterface.id]  # Flere interfaceid can legges in som en liste med komma 
  tags = local.tags
  

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
 
  
    
  }



