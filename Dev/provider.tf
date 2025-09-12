terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.41.0"
    }
  }
}
# Terraform Provider Block
provider "azurerm" {
  features {}
  subscription_id = "845670d0-6329-46a7-97a7-fe36dbdce51b"
}
# terraform {
#   backend "azurerm" {
#     resource_group_name  = "jaydeep_rg"
#     storage_account_name = "jaydeepstg321"
#     container_name       = "jaydeepcnt321"
#     key                  = "terraform.tfstate"

#   }
#  }