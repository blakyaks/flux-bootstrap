terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.46.0"
    }
    flux = {
      source  = "fluxcd/flux"
      version = ">= 0.24.2"
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