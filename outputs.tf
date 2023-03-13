output "master_public_ip" {
  value       = digitalocean_droplet.master.ipv4_address
  description = "The public IP address of the master node"
}
