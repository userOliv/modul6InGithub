#Felles variabler
variable "rgName" {
  type        = string
  description = "ressource grp location"
  default     = "rg11module11we11"

}


variable "location" {
  type        = string
  description = "ressource grp location"
  default     = "westeurope"

}


#Network variabler
variable "secGrpName" { # a component in virtual maskin scale set as well
  type        = string
  description = "network security group"
  default     = "ns11we11"

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

#Database variabler

variable "sa" {
  type        = string
  description = "mysql sa navn"
  default     = "sa1module51we"


}

variable "mysqlserver" {
  type        = string
  description = "mysql server navn"
  default     = "ser-1mysql1module5-1we"


}

variable "mysqlDatabase" {
  type        = string
  description = "mysql database navn"
  default     = "db1module51we"

}

# variables for virtual maskin scale set:

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



# virtual maskine som er enkeltvis ( Stand alone) maskines:
#itilleg til variablene nedenfor skal det være RG, lokasjon og subnet id som er allerede kjent i andre modulene over.

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


#Tags i local filen

variable "prosject" {
  type        = string
  description = "Subnet 2"
  default     = "module5"
}


variable "owner" {
  type        = string
  description = "Subnet 2"
  default     = "owner2"
}

variable "fakturaDep" {
  type        = string
  description = "Subnet 2"
  default     = "it-5"
}







