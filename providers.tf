provider "hcloud" {
  token = var.hetzner_token
}

variable "hetzner_token" {
}

terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = ">=1.33.2"
    }
  }
  required_version = ">= 0.12"
  backend "remote" {
    organization = "olender"
    workspaces {
      name = "terraform-hetzner"
    }
  }
}