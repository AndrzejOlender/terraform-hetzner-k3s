resource "null_resource" "custom" {
  # download kubectl
  provisioner "local-exec" {
    command = "curl -LO https://dl.k8s.io/release/v1.26.0/bin/linux/amd64/kubectl && chmod +x kubectl && mkdir -p ~/.local/bin && mv kubectl ~/.local/bin/kubectl && export PATH='$PATH:~/.local/bin/'"
  }
}