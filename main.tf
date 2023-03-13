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
resource "digitalocean_project" "infra" {
  name        = "Infra"
  description = "A project that holds all the resources used in the current infrastructure"
  resources   = [digitalocean_droplet.master.urn]
}

# Create the master node
# https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/droplet
resource "digitalocean_droplet" "master" {
  image      = "ubuntu-22-04-x64"
  name       = "master-node"
  size       = "s-1vcpu-512mb-10gb"
  region     = "nyc1"
  backups    = false
  monitoring = true
  ssh_keys   = [var.ssh_key]
}

# TODO: create alerts for the nodes
