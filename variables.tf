variable "ssh_keys" {
  type        = list(string)
  description = "Contains a list of all the ssh_keys that can access the cluster"
  sensitive   = true
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
variable "worker_node_count" {
  type        = number
  description = "Amount of worker nodes"
  default     = 2
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