variable "ssh_key" {
  type      = string
  sensitive = true
}

# Project related variables
variable "cluster_name" {
  type        = string
  description = "Name of the project in DigitalOcean"
  default     = "Cluster"
}
variable "cluster_description" {
  type        = string
  description = "Description of the project in DigitalOcean"
  default     = "Cluster of nodes"
}

# Master node related variables
variable "master_node_name" {
  type        = string
  description = "Name of the master node"
  default     = "master"
}
variable "master_node_image" {
  type        = string
  description = "Image of the master node"
  default     = "ubuntu-22-04-x64"
}
variable "master_node_size" {
  type        = string
  description = "Size of the master node"
  default     = "s-1vcpu-512mb-10gb"
}

# Worker nodes related variables
variable "worker_node_name" {
  type        = string
  description = "Base name of the worker node in the format: $name-$i"
  default     = "worker"
}
variable "worker_node_image" {
  type        = string
  description = "Image of the worker nodes"
  default     = "ubuntu-22-04-x64"
}
variable "worker_node_size" {
  type        = string
  description = "Size of the worker nodes"
  default     = "s-1vcpu-512mb-10gb"
}

# Common variables for all nodes
variable "region" {
  type        = string
  description = "Region in which the nodes will be created in"
  default     = "nyc1"
}
variable "alert_email" {
  type        = string
  description = "Email address to send alerts to"
}