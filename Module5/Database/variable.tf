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


variable "sa" {
  type        = string
  description = "mysql sa navn"
  default     = "sa1module51we"


}

variable "mysqlserver"{
type        = string
  description = "mysql server navn"
  default     = "servermy-sql1module51-we"

}

variable "mysqlDatabase" {
  type        = string
  description = "mysql database navn"
  default     = "db1module51we"

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