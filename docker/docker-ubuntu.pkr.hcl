packer {
  required_plugins {
    docker = {
      version = ">= 1.0.8"
      source = "github.com/hashicorp/docker"
    }
    ansible = {
      version = "~> 1"
      source = "github.com/hashicorp/ansible"
    }
  }
}



source "docker" "ubuntu" {
  image  = "ubuntu:jammy"
  commit = true
    changes = [
      "LABEL version=1.0",
      "ONBUILD RUN date",
      "RUN apt-update",
      "RUN apt-get -y install ansible"
    ]
}

build {
  name    = "learn-packer"
  sources = [
    "source.docker.ubuntu"
  ]
  provisioner "ansible-local" {
      playbook_file = "../add_monero.yaml"
      inventory_file = "hosts.yaml"
    }
}
