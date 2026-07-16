resource azurerm_resource_group rg {
  name     = "${local.project_name}-rg"
  location = var.location
}


output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

resource azurerm_storage_account sa {
  name                     = "${var.project_name}${terraform.workspace}storage"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = local.account_replication_type
}

output "storage_account_name" {
  value = azurerm_storage_account.sa.name
}