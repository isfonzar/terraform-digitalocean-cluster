# terraform-digitalocean-cluster
Terraform configuration for a cluster with master node and worker nodes in DigitalOcean

## Usage

Add the following to your terraform configuration

```terraform
resource "digitalocean_ssh_key" "default" {
  # (...)
}

module "cluster" {
  source = "../../../modules/services/cluster"

  ssh_key = digitalocean_ssh_key.default.id
}
```

and then run

```shell
$ terraform apply
```
