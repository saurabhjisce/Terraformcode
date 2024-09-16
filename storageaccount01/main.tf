resource "azurerm_storage_account" "stgsamap" {
  for_each = var.stgsa234
  name                     =  each.value.name
  resource_group_name      =  data.azurerm_resource_group.rgdata01.name
  location                 =  data.azurerm_resource_group.rgdata01.location
  account_tier             =  "Standard"
  account_replication_type =  "LRS"
}
  
