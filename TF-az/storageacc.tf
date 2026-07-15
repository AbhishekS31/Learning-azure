

resource "azurerm_storage_account" "example" {    

  lifecycle {
    create_before_destroy = true # Create the new resource before destroying the old one
    # ignore_changes = [ account_replication_type ] # Changes to account_replication_type will be ignored
    # replace_triggered_by = [ azurerm_resource_group.example.id ] # Trigger replacement if the resource group changes
    # custom condition 
    precondition {
      condition     = var.environment == "staging" ? true : false
      error_message = "This resource can only be created in the staging environment."
    }
    prevent_destroy = true # Prevent accidental deletion of the resource
  }

  for_each = var.storage_account
  name                     = each.value
  resource_group_name      = data.azurerm_resource_group.example.name
  location                 = data.azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS" 

  tags = {
    environment = var.environment
  }
}

