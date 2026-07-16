variable "proxmox_url" {
  type = string
}

variable "proxmox_token_id" {
  type      = string
  sensitive = true
}

variable "proxmox_token_secret" {
  type      = string
  sensitive = true
}

variable "node" {
  type    = string
  default = "pve"
}

variable "storage" {
  type    = string
  default = "local-lvm"
}

variable "bridge" {
  type    = string
  default = "vmbr0"
}

variable "nameserver" {
  type    = string
  default = "192.168.0.1"
}

variable "ssh_public_key" {
  type = string
}

variable "lxc_password" {
  description = "Root password for LXC containers"
  type        = string
  sensitive   = true
}
