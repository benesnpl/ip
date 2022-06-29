resource "azurerm_resource_group" "this" {
  location = var.resource_location
  name     = var.resource_group_name
}

resource "azurerm_public_ip" "management" {
  name                = "malakas"
  location            = var.resource_location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  depends_on          = ["azurerm_resource_group.this"]
  availability_zone   = "No-Zone"
}
