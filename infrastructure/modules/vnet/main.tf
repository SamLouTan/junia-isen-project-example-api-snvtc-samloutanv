resource "azurerm_virtual_network" "vnet" {
  name                = "${var.random_id}-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "subnet_app_service" {
  name                = "subnet-app-service-${var.random_id}"
  resource_group_name = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes    = ["10.0.1.0/24"]
  delegation {
    name = "delegation-app-service-${var.random_id}"
    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}

resource "azurerm_subnet" "subnet_db" {
  name                = "subnet-db-${var.random_id}"
  resource_group_name = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes    = ["10.0.2.0/24"]
  service_endpoints = ["Microsoft.Storage"]
  delegation {
    name = "delegation-db-${var.random_id}"
    service_delegation {
      name    = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
}
