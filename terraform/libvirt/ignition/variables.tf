variable "identity" {
  description = "name to identify all managed resources"
  type        = string
  default     = "cloud-init"
}

variable "imgPath" {
  description = "Path to existing base QEMU img file"
  type        = string
  default     = "/var/lib/libvirt/images/example.qcow2"
}
