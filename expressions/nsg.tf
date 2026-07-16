

resource "azurerm_network_security_group" "example" {
  name                = "acceptanceTestSecurityGroup1"
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name

    # dynamic block for security rules
    dynamic security_rule {
        for_each = local.nsg_rule
        content {
        name                       = security_rule.key
        priority                   = security_rule.value.priority
        direction                  = "Inbound"
        access                     = security_rule.value.access
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
 }
        tags = {
            environment = "dev"
        }
}
