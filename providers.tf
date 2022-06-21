provider "azuread" {
  tenant_id       = var.tenant_id
  subscription_id = "75710043-706c-4880-8f0d-650e92f05d43"
  client_id      = var.client_id
  client_secret   = var.client_secret
}

provider "azurerm" {
  tenant_id       = var.tenant_id
  subscription_id = "75710043-706c-4880-8f0d-650e92f05d43"
  client_id       = var.client_id
  client_secret   = var.client_secret
  features {}
}

terraform {
  required_version = ">= 1.2.1"
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "=2.24.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.9.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "cloud-shell-storage-westeurope"
    storage_account_name = "terraformbackendpankaj"
    container_name       = "tfstate"
    key                  = "tfstate-1"
    tenant_id            = var.tenant_id
    subscription_id      = "75710043-706c-4880-8f0d-650e92f05d43"
    client_id            = var.client_id
    client_secret        = var.client_secret
  }
}

