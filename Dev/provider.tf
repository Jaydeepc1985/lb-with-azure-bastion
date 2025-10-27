terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.47.0"
    }
  }
}
# Terraform Provider Block
provider "azurerm" {
  features {}
  subscription_id = "98b7163f-e961-4b65-98c2-7a6dc2edf5b7"
}
# terraform {
#   backend "azurerm" {
#     resource_group_name  = "jaydeep_rg"
#     storage_account_name = "jaydeepstg321"
#     container_name       = "jaydeepcnt321"
#     key                  = "terraform.tfstate"

#   }
#  }