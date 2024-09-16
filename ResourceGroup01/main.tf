resource "azurerm_resource_group" "rgblock01" {
    for_each = var.rgvm01
    name =  each.value.name
    location = each.value.location
}