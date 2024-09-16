data "azurerm_resource_group" "rgdata01" {
     name = "rg-qavk-vm02"
     
}
data "azurerm_network_interface" "azrnicdata01" {
    for_each = var.azrdatavm01
  name              = each.value.nname
  resource_group_name = data.azurerm_resource_group.rgdata01.name
}

