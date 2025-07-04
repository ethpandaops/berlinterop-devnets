////////////////////////////////////////////////////////////////////////////////////////
//                            TERRAFORM PROVIDERS & BACKEND
////////////////////////////////////////////////////////////////////////////////////////
terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.28"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.42.1"
    }
  }
}

terraform {
  backend "s3" {
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    endpoints                   = { s3 = "https://fra1.digitaloceanspaces.com" }
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
    region                      = "us-east-1"
    bucket                      = "merge-testnets"
    key                         = "infrastructure/berlinterop-devnet-2/terraform.tfstate"
  }
}

provider "digitalocean" {
  http_retry_max = 20
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

////////////////////////////////////////////////////////////////////////////////////////
//                                        VARIABLES
////////////////////////////////////////////////////////////////////////////////////////
variable "cloudflare_api_token" {
  type        = string
  sensitive   = true
  description = "Cloudflare API Token"
}

variable "ethereum_network" {
  type    = string
  default = "berlinterop-devnet-2"
}

variable "base_cidr_block" {
  default = "10.109.0.0/16"
}
////////////////////////////////////////////////////////////////////////////////////////
//                                        LOCALS
////////////////////////////////////////////////////////////////////////////////////////
locals {
  vm_groups = [
    var.bootnode,
    var.lighthouse_geth,
    var.lighthouse_nethermind,
    var.lighthouse_erigon,
    var.lighthouse_besu,
    var.lighthouse_reth,
    var.lighthouse_nimbusel,
    var.prysm_geth,
    var.prysm_nethermind,
    var.prysm_erigon,
    var.prysm_besu,
    var.prysm_reth,
    var.prysm_nimbusel,
    var.lodestar_geth,
    var.lodestar_nethermind,
    var.lodestar_erigon,
    var.lodestar_besu,
    var.lodestar_reth,
    var.lodestar_nimbusel,
    var.nimbus_geth,
    var.nimbus_nethermind,
    var.nimbus_erigon,
    var.nimbus_besu,
    var.nimbus_reth,
    var.nimbus_nimbusel,
    var.teku_geth,
    var.teku_nethermind,
    var.teku_erigon,
    var.teku_besu,
    var.teku_reth,
    var.teku_nimbusel,
    var.grandine_geth,
    var.grandine_nethermind,
    var.grandine_erigon,
    var.grandine_besu,
    var.grandine_reth,
    var.grandine_nimbusel,
  ]
}
