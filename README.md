# terraform-digitalocean-cluster
[Terraform] module for a cluster with a master node and some worker nodes in [DigitalOcean]

## Usage

Add the following to your terraform configuration

```terraform
resource "digitalocean_ssh_key" "default" {
  # (...)
}

module "cluster" {
  source = "github.com/isfonzar/terraform-digitalocean-cluster?ref=v0.1.2"

  ssh_key = digitalocean_ssh_key.default.id
}
```

and then run

```shell
$ terraform apply
```

[DigitalOcean]: https://www.digitalocean.com
[Terraform]: https://www.terraform.io
