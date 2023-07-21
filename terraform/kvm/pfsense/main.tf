provider "libvirt" {
  uri = "qemu:///system"
}

resource "libvirt_domain" "pfsense_machine" {
  name             = "pfsenseMachine"
  memory           = "2000"
  vcpu             = 1

  disk {
    volume_id = libvirt_volume.pfsense_volume.id
  }

  network_interface {
    bridge = "br0"
  }

  # network_interface {
  #   network_id = libvirt_network.pfsense_network.id
  # }
}

resource "libvirt_volume" "pfsense_volume" {
  name   = "pfsenseVolume"
  source = var.qcow2image
}

resource "libvirt_network" "pfsense_network" {
  name      = "pfsenseNetwork"
  addresses = ["192.168.123.0/24"]
  dhcp {
    enabled = true
  }
}
