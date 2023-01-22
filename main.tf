module "k3s" {
  source          = "BerndDA/k3s/hcloud"
  version         = "0.1.9"
  hetzner_token = var.hetzner_token
  cluster_name  = "k3s"
  main_pool_config = {
    node_type = "cx11"
    num_nodes = 1
  }
  worker_pool_config = {
    node_type = "cx11"
    num_nodes = 1
  }
  k3s_version = "v1.25.5+k3s2"
}

