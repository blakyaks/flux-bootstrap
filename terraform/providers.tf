locals {
  kube_provider = {
    host                   = coalesce(try(data.azurerm_kubernetes_cluster.this.kube_admin_config[0].host, null), data.azurerm_kubernetes_cluster.this.kube_config[0].host)
    client_certificate     = base64decode(coalesce(try(data.azurerm_kubernetes_cluster.this.kube_admin_config[0].client_certificate, null), data.azurerm_kubernetes_cluster.this.kube_config[0].client_certificate))
    client_key             = base64decode(coalesce(try(data.azurerm_kubernetes_cluster.this.kube_admin_config[0].client_key, null), data.azurerm_kubernetes_cluster.this.kube_config[0].client_key))
    cluster_ca_certificate = base64decode(coalesce(try(data.azurerm_kubernetes_cluster.this.kube_admin_config[0].cluster_ca_certificate, null), data.azurerm_kubernetes_cluster.this.kube_config[0].cluster_ca_certificate))
  }
}

provider "azurerm" {
  features {}
}

provider "flux" {
  host                   = local.kube_provider.host
  client_certificate     = local.kube_provider.client_certificate
  client_key             = local.kube_provider.client_key
  cluster_ca_certificate = local.kube_provider.cluster_ca_certificate
}

provider "kubernetes" {
  host                   = local.kube_provider.host
  client_certificate     = local.kube_provider.client_certificate
  client_key             = local.kube_provider.client_key
  cluster_ca_certificate = local.kube_provider.cluster_ca_certificate
}