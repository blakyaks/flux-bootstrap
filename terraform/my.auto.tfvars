# AKS cluster properties
aks_resource_group_name = "RESOURCE_GROUP_NAME_WITH_AKS_RESOURCE"
aks_cluster_name        = "AKS_RESOURCE_NAME"

# Target Git repository properties
system_repo = {
  url = "ssh://git@github.com/GITHUB_USERNAME/flux-bootstrap.git"
}

# Deployment SSH credentials (read/write)
bootstrap_credentials = {
  ssh_private_key_path = "PATH_TO_YOUR_SSH_ADMIN_PRIVATE_KEY"
}

# Flux SSH credentials (read-only)
flux_credentials = {
  ssh_private_key_path = "PATH_TO_YOUR_SSH_DEPLOY_PRIVATE_KEY"
  ssh_public_key_path  = "PATH_TO_YOUR_SSH_DEPLOY_PUBLIC_KEY"
}