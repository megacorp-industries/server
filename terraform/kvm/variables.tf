variable "ignitionfile" {
  description = "Path to ignition file"
  type        = string
  default     = "/tmp/config.ign"
}

variable "qcow2image" {
  description = "Path to coreos qcow2 image"
  type        = string
  default     = "/var/lib/libvirt/images/coreos.qcow2"
}
