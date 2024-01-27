terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
    }
  }
  required_version = ">= 0.13"
}

provider "hcloud" {
  token   = var.hcloud_token
}

resource "hcloud_ssh_key" "quester" {
  name       = "quester_key"
  public_key = file("~/quester.pub")
}

resource "hcloud_server" "web_quester" {
  count       = 1
  name        = "web-quester-1"
  image       = "ubuntu-20.04"
  server_type = "cx11"
  location    = "nbg1"
  ssh_keys    = [hcloud_ssh_key.quester.id]
  labels = {
    type = "web-quester"
  }
  user_data = file("user_data.yml")

  connection {
    type        = "ssh"
    timeout     = "4m"
    user        = "devops"
    private_key = file("~/quester")
    host        = self.ipv4_address
  }

  provisioner "file" {
    source = "docker-compose.yml"
    destination = "/var/tmp/docker-compose.yml"
  }

  provisioner "remote-exec" {
    inline = [
      "cd /var/tmp",
      "docker-compose up -d",
    ]
  }

#добавить nginx
}

#resource "hcloud_ssh_key" "web-quester-key" {
#  name       = "quester_key"
#  public_key = file("~/quester.pub")
#}

#  ssh_public_key      = file("~/quester.pub")     
#  provisioner_private_key = file("~/quester")

#  provisioner_source = "${path.module}/docker-compose.yml"
