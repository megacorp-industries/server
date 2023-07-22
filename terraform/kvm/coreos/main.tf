terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}

provider "libvirt" {
  uri = "qemu:///system"
}

resource "libvirt_ignition" "ignition" {
  name    = "config.ign"
  content = var.ignitionfile
}

resource "libvirt_domain" "coreos_machine" {
  name             = "coreosMachine"
  coreos_ignition  = libvirt_ignition.ignition.id
  memory           = "2048"
  vcpu             = 1

  disk {
    volume_id = libvirt_volume.coreos_volume.id
  }

  network_interface {
    bridge = "br0"
  }
}

resource "libvirt_volume" "coreos_volume" {
  name   = "coreosVolume"
  source = var.qcow2image
}
