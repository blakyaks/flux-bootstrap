data "external" "known_hosts" {
  program = ["pwsh", "-Command", "@{key=$(ssh-keyscan ${local.ssh_host} 2>/dev/null) | Out-String} | ConvertTo-Json"]
}

data "azurerm_kubernetes_cluster" "this" {
  name                = var.aks_cluster_name
  resource_group_name = var.aks_resource_group_name
}