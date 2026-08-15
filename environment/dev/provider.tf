terraform {
  backend "azurerm" {
    resource_group_name  = "Test-rg"       # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "pankajstorage" # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "statefile"     # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "prod.terraform.tfstate"
    use_oidc             = "true" # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=5.0.0"
    }
  }
}


provider "azurerm" {
  features {}
}