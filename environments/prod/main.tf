provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

# Use existing resource group
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

# Construct resource names dynamically
locals {
  vnet_name            = "opella${var.environment}vnet01"
  storage_account_name = "opella${var.environment}sta01"
}

module "vnet" {
  source              = "../../modules/vnet"
  vnet_name           = local.vnet_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  address_space       = var.address_space
  subnets             = var.subnets
  tags                = var.tags
}

resource "azurerm_storage_account" "storage" {
  name                     = local.storage_account_name
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = var.Replication #"LRS"

  network_rules {
    default_action             = "Deny"
    bypass                     = ["AzureServices"]
    virtual_network_subnet_ids = [
      module.vnet.subnet_ids["private-subnet"]
    ]
  }

  tags = var.tags
}

output "storage_account_id" {
  value = azurerm_storage_account.storage.id
}

output "subnet_id" {
  value = module.vnet.subnet_ids["private-subnet"]
}
