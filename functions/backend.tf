terraform {
  backend "azurerm" {
    resource_group_name  = "az-rg-tfstate"
    storage_account_name = "mystorageaccounttf3110"
    container_name       = "tfstate"
    key                  = "demo.terraform.tfstate" 
  }
}