# terraform-digitalocean-cluster
[Terraform] module for a cluster with a master node and some worker nodes in [DigitalOcean]

![Terraform fmt](https://github.com/isfonzar/terraform-digitalocean-cluster/actions/workflows/terraform-fmt.yml/badge.svg)
![version](https://img.shields.io/github/v/tag/isfonzar/terraform-digitalocean-cluster)

## Usage

Add the following to your terraform configuration

```terraform
resource "digitalocean_ssh_key" "ssh_keys" {
  name       = each.key
  public_key = file("${path.module}/ssh_keys/${each.value}")
  for_each   = local.ssh_keys
}

module "cluster" {
  source = "github.com/isfonzar/terraform-digitalocean-cluster?ref=v0.1.2"

  ssh_keys    = values(digitalocean_ssh_key.ssh_keys)[*].id
  alert_email = "yourbestemail@example.com"
  
  worker_node_count = 3 # amount of worker nodes (default: 2)
}
```

and then run

```shell
$ terraform apply
```

## Collaboration

1. Install [pre-commit]. E.g. `brew install pre-commit`.
2. Run `pre-commit install` in the repo.
3. Start coding

[DigitalOcean]: https://www.digitalocean.com
[Terraform]: https://www.terraform.io
[pre-commit]: http://pre-commit.com/
