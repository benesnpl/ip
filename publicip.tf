resource "azurerm_public_ip" "management" {
  for_each            = var.vmseries
  name                = "${each.key}-nic-management-pip"
  location            = var.resource_location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}
