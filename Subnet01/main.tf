resource "azurerm_subnet" "rsvmsbnt01" {
  for_each = var.azrvmsubnt01
  name                 = each.value.name
  resource_group_name  = data.azurerm_resource_group.rgdata01.name
  virtual_network_name = data.azurerm_virtual_network.datavnet01.name
  address_prefixes     = each.value.address_prefixes
}