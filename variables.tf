variable "ssh_key" {
  type      = string
  sensitive = true
}

# Project related variables
variable "cluster_name" {
  type    = string
  default = "Cluster"
}
variable "cluster_description" {
  type    = string
  default = "Cluster of nodes"
}
