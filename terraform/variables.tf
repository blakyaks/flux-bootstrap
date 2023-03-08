variable "aks_resource_group_name" {
  description = "Name of the resource group containing the AKS cluster resource."
  type        = string
}

variable "aks_cluster_name" {
  description = "Name of the target AKS cluster resource."
  type        = string
}

variable "system_repo" {
  description = "Defines the system repository to be initialized and synchronised by the cluster."
  type = object({
    url       = optional(string, null)
    path      = optional(string, null)
    branch    = optional(string, "main")
    namespace = optional(string, "flux-system")
    secret    = optional(string, "flux-sync") # Existing secret that specifies the SSH keys for repo access
  })
  default = {}
}

variable "bootstrap_credentials" {
  description = "(Optional) The credentials used to publish the initial Flux configuration for the cluster.  Requires read/write access to the target repoistory."
  type = object({
    author_email         = optional(string, "fluxcd@blakyaks.com")
    author_name          = optional(string, "Flux CD Bot")
    commit_message       = optional(string, "chore(flux-cd): Cluster Bootstrap Update")
    ssh_private_key_path = optional(string, "~/.ssh/id_rsa")
    ssh_username         = optional(string, "git")
    ssh_passphrase       = optional(string, null)
  })
  default = {}
}

variable "flux_credentials" {
  description = "(Optional) The credentials used by Flux to pull configuration to the cluster.  Requires read-only access to the target repoistory."
  type = object({
    ssh_private_key_path = optional(string, "~/.ssh/id_rsa")
    ssh_public_key_path  = optional(string, "~/.ssh/id_rsa.pub")
  })
  default = {}
}

variable "flux_properties" {
  description = "(Optional) Properties for the Flux installation."
  type = object({
    cluster_domain    = optional(string, "cluster.local")
    components        = optional(list(string), null)
    components_extra  = optional(list(string), [])
    image_pull_secret = optional(string, null)
    log_level         = optional(string, "debug")
    network_policy    = optional(bool, true)
    registry          = optional(string, "ghcr.io/fluxcd")
    toleration_keys   = optional(list(string), [])
    version           = optional(string, "v0.40.2")
  })
  default = {}
}

variable "kustomization_override" {
  description = "(Optional) Extra text to append in the kustomization object of the cluster."
  type        = string
  default     = null
}
