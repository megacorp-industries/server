variable "identity" {
  description = "name to identify all managed resources"
  type        = string
  default     = "cloud-init"
}

variable "imgPath" {
  description = "Path to existing base QEMU img file"
  type        = string
  default     = "https://cloud-images.ubuntu.com/releases/23.04/release/ubuntu-23.04-server-cloudimg-amd64.img"
}
