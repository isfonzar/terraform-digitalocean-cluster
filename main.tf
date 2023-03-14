terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.26.0"
    }
  }

  required_version = ">= 1.4.0"
}

locals {
  alert_time_window          = "5m"
  alert_compare_greater_than = "GreaterThan"
  alert_cpu_type             = "v1/insights/droplet/cpu"
  alert_cpu_threshold        = 90
  alert_cpu_enabled          = true
  alert_memory_type          = "v1/insights/droplet/memory_utilization_percent"
  alert_memory_threshold     = 90
  alert_memory_enabled       = true
}

# Create main infrastructure project that will hold all resources
# https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/project
resource "digitalocean_project" "cluster" {
  name        = var.cluster_name
  description = var.cluster_description
  resources   = [digitalocean_droplet.master.urn]
}

# Create the master node
# https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/droplet
resource "digitalocean_droplet" "master" {
  name       = var.master_node_name
  image      = var.master_node_image
  size       = var.master_node_size
  region     = var.region
  monitoring = true
  ssh_keys   = [var.ssh_key]
}

resource "digitalocean_monitor_alert" "cpu_alert" {
  alerts {
    email = [var.alert_email]
  }
  window      = local.alert_time_window
  type        = local.alert_cpu_type
  compare     = local.alert_compare_greater_than
  value       = local.alert_cpu_threshold
  enabled     = local.alert_cpu_enabled
  entities    = [digitalocean_droplet.master.id]
  description = "CPU usage is above ${local.alert_cpu_threshold}% for the last ${local.alert_time_window}"
}

resource "digitalocean_monitor_alert" "memory_alert" {
  alerts {
    email = [var.alert_email]
  }
  window      = local.alert_time_window
  type        = local.alert_memory_type
  compare     = local.alert_compare_greater_than
  value       = local.alert_memory_threshold
  enabled     = local.alert_memory_enabled
  entities    = [digitalocean_droplet.master.id]
  description = "Memory utilization is above ${local.alert_cpu_threshold}% for the last ${local.alert_time_window}"
}
