variable "environment" {
  description = "The environment for the resources"
  type        = string
  default     = "staging"
}

variable "storage_disk" {
  description = "The storage disk size in GB"
  type = number
  default = 30
}

variable "allowed_location" {
  description = "list of allowed locations for resources"
  type = list(string)
  default = [ "West Europe", "Central India", "East US" ]
}

variable "storage_account" {
  description = "list of the storage account"
  type        = set(string)
  default     = [ "mystorageaccount112233" ,"mystorageaccount332211" ]
}