terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}

provider "libvirt" {
  uri = "qemu:///system"
}

resource "random_string" "generator" {
  length  = 2
  special = false
  lower   = false
}

resource "libvirt_ignition" "ignition" {
  name    = "config.ign"
  content = var.ignitionfile
}

resource "libvirt_volume" "ignition_volume" {
  name   = "${var.identity}-${random_string.generator.id}"
  source = "${var.imgPath}"
  format = "qcow2"
}

resource "libvirt_domain" "ignition_domain" {
  name   = "${var.identity}-${random_string.generator.id}"
  memory = "2048"
  vcpu   = 1


  disk {
    volume_id = libvirt_volume.ignition_volume.id
  }

  network_interface {
    network_name = "default"
  }

  # IMPORTANT: this is a known bug on cloud images, since they expect a console
  # we need to pass it
  # https://bugs.launchpad.net/cloud-images/+bug/1573095
  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }
}
