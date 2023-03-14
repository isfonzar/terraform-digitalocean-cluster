output "master_public_ip" {
  value       = digitalocean_droplet.master.ipv4_address
  description = "The public IP address of the master node"
}

output "worker_public_ips" {
  value       = digitalocean_droplet.worker[*].ipv4_address
  description = "Public IP addresses of the worker nodes"
}

output "master_urn" {
  value       = digitalocean_droplet.master.urn
  description = "master node uniform resource name"
}

output "workers_urn" {
  value       = digitalocean_droplet.worker[*].urn
  description = "worker nodes uniform resource names"
}
