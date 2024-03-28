variable "secGrpName" {
  type        = string
  description = "network security group"
  default     = "ns11we11"

}




variable "netsecRuleName" {
  type        = string
  description = "network security rule"
  default     = "nscl11we11"

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

variable "vn" {
  type        = string
  description = "Virtual network 1"
  default     = "vn11we11"
}


variable "subnet1" {
  type        = string
  description = "Subnet 1"
  default     = "subnetet1"
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