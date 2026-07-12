# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
    backend "azurerm" {
      resource_group_name  = "az-rg-tfstate"
      storage_account_name = "mystorageaccounttf3110"
      container_name       = "tfstate"
      key                  = "demo.terraform.tfstate"
  }
  required_version = ">= 1.1.0"
}
 
provider "azurerm" {
  features {}
}

# variable "environment" {
#   description = "The environment for the resources"
#   type        = string
#   default     = "staging"
# }

resource "azurerm_resource_group" "example" {
  name     = "az-learn-rg-tf"
  location = "Central India"
}

resource "azurerm_storage_account" "example" {
  name                     = "mystorageaccount3110"
  resource_group_name      = azurerm_resource_group.example.name 
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

output "storage_account_name" {
  value = azurerm_storage_account.example.name
}