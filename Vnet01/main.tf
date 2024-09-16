resource "azurerm_virtual_network" "rsvmqa01" {
  for_each = var.azrvmnet01
  name                = each.value.name
  address_space       = each.value.address_space
  location            = data.azurerm_resource_group.rgdata01.location
  resource_group_name = data.azurerm_resource_group.rgdata01.name

}