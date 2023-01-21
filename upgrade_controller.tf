resource "null_resource" "k3s_upgrade" {
  count = 1
  depends_on = [
    null_resource.upgrade_controller
  ]
  triggers = {
    upgrade_k3s = var.k3s_version
  }
  provisioner "local-exec" {
    command = "kubectl wait deployment -n system-upgrade system-upgrade-controller --for condition=Available=True --timeout=90s --kubeconfig ${var.kubeconfig_file}"
  }
  provisioner "local-exec" {
    command = local.upgrade_main
  }
  provisioner "local-exec" {
    command = local.upgrade_worker
  }
  provisioner "local-exec" {
    command = "curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && chmod +x kubectl"
  }
} 