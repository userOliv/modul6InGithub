





resource "azurerm_network_security_group" "SecGrp" {
  name                = var.secGrpName
  location            = var.location
  resource_group_name = var.rgName
   tags = local.tags

}





resource "azurerm_network_security_rule" "netsecR" {
  name                        = var.netsecRuleName
  priority                    = 100
  direction                   ="Inbound" #"Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389" # skal også tillate en liste med flere port.
  source_address_prefix       = "51.175.162.39" # ikke mellomrom i stringen
  destination_address_prefix  ="20.0.1.0/24" # "*" stjerne er på any network, men her settes rullen til 20.0.1 network.
  resource_group_name         = var.rgName # azurerm_resource_group.example.name
  network_security_group_name =var.secGrpName  #    azurerm_network_security_group.example.name
   
}  # itillegg til de variablene foreligger det en security_rule id alltid includert selv om ikke listet her. 




resource "azurerm_virtual_network" "vnName" { # gjøre koden dynamisk med liste eller mappe .
  name                = var.vn
  location            = var.location
  resource_group_name = var.rgName

  address_space = ["20.0.0.0/16"]          # gjøre koden dynamisk med liste eller mappe .
  dns_servers   = ["20.0.0.4", "20.0.0.5"] # gjøre koden dynamisk med liste eller mappe .
 tags = local.tags

}


resource "azurerm_subnet" "subnet1" {

  name                = var.subnet1
  resource_group_name = var.rgName

  virtual_network_name = var.vn
  address_prefixes     =[ "20.0.1.0/24"]
  
}


resource "azurerm_subnet_network_security_group_association" "connectSubnet" {
  network_security_group_id =azurerm_network_security_group.SecGrp.id
  subnet_id                 = azurerm_subnet.subnet1.id

}




