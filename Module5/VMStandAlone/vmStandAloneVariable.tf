

variable "rgName" {
  type        = string
  description = "ressource group til sa og vn i module3"
  default     = "rg13we13"
}

variable "location" {
  type        = string
  description = "ressource group til sa og vn i module3"
  default     = ""
}


variable "subnet1_id" {
  type        = string
  description = "ressource group til sa og vn i module3"
  default     = " "
}


variable "vmName" {
  type        = string
  description = "ressource group til sa og vn i module3"
  default     = "vm-win-13we13"
}



variable "interfaceName" {
  type        = string
  description = "network security rule"
  default     = "intf11we11"

}


variable "publicIpName" {
  type        = string
  description = "network security rule"
  default     = "pi-vm1-we"

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


