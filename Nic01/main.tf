resource "azurerm_network_interface" "rgvm01" {

  for_each = var.azrvmnetwrkface
  name                = each.value.name
  location            = data.azurerm_resource_group.rgdata01.location
  resource_group_name = data.azurerm_resource_group.rgdata01.name

  ip_configuration {
    name                          = "internal01"
    subnet_id                     =  data.azurerm_subnet.azrdatasubnt01[each.key].id
    private_ip_address_allocation = "Dynamic"
    primary = true
  }
}