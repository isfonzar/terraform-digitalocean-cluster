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

## Collaboration

1. Install [pre-commit]. E.g. `brew install pre-commit`.
2. Run `pre-commit install` in the repo.
3. Start coding

[DigitalOcean]: https://www.digitalocean.com
[Terraform]: https://www.terraform.io
[pre-commit]: http://pre-commit.com/
