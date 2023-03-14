output "master_public_ip" {
  value       = digitalocean_droplet.master.ipv4_address
  description = "The public IP address of the master node"
}

output "worker_public_ips" {
  value       = digitalocean_droplet.worker[*].ipv4_address
  description = "Public IP addresses of the worker nodes"
}
