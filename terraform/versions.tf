terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.46.0"
    }
    flux = {
      source  = "fluxcd/flux"
      version = "= 0.25.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.18.0"
    }
    external = {
      source  = "hashicorp/external"
      version = ">= 2.3.1"
    }
  }
}