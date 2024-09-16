data "azurerm_resource_group" "rgdata01" {
     name = "rg-qavk-vm02"
     
}

data "azurerm_virtual_network" "datavnet01" {
  name          = "GOAZRVNET002"
  resource_group_name = data.azurerm_resource_group.rgdata01.name
}


data "azurerm_subnet" "azrdatasubnt01" {
  for_each = var.azrvmnetwrkface
  name                 = each.value.sname
  virtual_network_name = data.azurerm_virtual_network.datavnet01.name
  resource_group_name  = data.azurerm_resource_group.rgdata01.name
}




