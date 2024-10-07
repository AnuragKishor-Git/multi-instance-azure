terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.9.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "rg" {
  count = 3
  name     = "azure-lab-${count.index}"
  location = var.az_region
  tags = merge({ "Name" = "azure-lab" }, var.tags, )
}
