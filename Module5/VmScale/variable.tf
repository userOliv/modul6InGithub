variable "secGrpName" {
  type        = string
  description = "network security group"
  default     = "ns11we11"

}


variable "rgName" {
  type        = string
  description = "ressource group til sa og vn i module3"
  default     = "rg13we13"
}


variable "location" {
  type        = string
  description = "ressource grp location"
  default     = "westeurope"

}

variable "vmss1" {
  type        = string
  description = "Virtual maskin scale sett 1"
  default     = "vmss1"
}


variable "subnet_id" {
  type        = string
  description = "Subnet 1"
  default     = "" # det er tilsiktet med tom string, da subnet id hentes fra andre moduler. 
}


#tags variabler

variable "prosject" {
  type        = string
  description = "Subnet 2"
  default     = "module4"
}


variable "owner" {
  type        = string
  description = "Subnet 2"
  default     = "owner"
}

variable "fakturaDep" {
  type        = string
  description = "Subnet 2"
  default     = "it-4"
}

locals {
  tags = {
    prosject   = var.prosject
    fakturaDep = var.fakturaDep
    owner      = var.owner
  }
}
