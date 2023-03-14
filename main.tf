terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.26.0"
    }
  }

  required_version = ">= 1.4.0"
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

# TODO: create alerts for the nodes
