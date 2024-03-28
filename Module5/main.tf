terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.89.0"
    }
  }
}
provider "azurerm" {
  features {
  }
}
resource "azurerm_resource_group" "rgrup" {

  # count    = length(var.rgName)
  name     = var.rgName
  location = var.location
   tags     = local.tags
  

}



module "network" {
  source     = "./Network"
  location   = var.location
  rgName     = var.rgName # hvis det ikke går benytte full resource_group navn og peke på rgName
  vn         = var.vn
  subnet1    = var.subnet1
  secGrpName = var.secGrpName
  #tags variabler
prosject=var.prosject
owner=var.owner
fakturaDep=var.fakturaDep



}


module "database" {
  source        = "./Database"
  location      = var.location
  rgName        = var.rgName # hvis det ikke går benytte full resource_group navn og peke på rgName
  sa            = var.sa
  mysqlserver   = var.mysqlserver
  mysqlDatabase = var.mysqlDatabase
  #tags variabler
prosject = var.prosject
owner = var.owner
fakturaDep = var.fakturaDep



}

module "vmscaleset" { #virtual maskin skale module eller classe
  source     = "./VmScale"
  location   = var.location
  rgName     = var.rgName # hvis det ikke går benytte full resource_group navn og peke på rgName
  secGrpName = var.secGrpName
  vmss1      = var.vmss1
  subnet_id  = module.network.subnet1_Id # hentes fra output fila av Network
  #tags variabler
prosject = var.prosject
owner = var.owner
fakturaDep = var.fakturaDep



}

module VMStandAlone{ # virtual maskiner som er enkeltvis ( stand alone)
  source = "./VMStandAlone"
 location   = var.location
  rgName     = var.rgName
  vmName=var.vmName
  interfaceName = var.interfaceName
  subnet1_id  = module.network.subnet1_Id
  publicIpName = var.publicIpName
#tags variabler
prosject = var.prosject
owner = var.owner
fakturaDep = var.fakturaDep


}








