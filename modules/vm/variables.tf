variable "name" { type = string }
variable "node" { type = string }
variable "vmid" { type = number }

variable "clone_vmid" {
  type = number
}

variable "storage" {
  type = string
}

variable "memory" {
  type    = number
  default = 2048
}

variable "cores" {
  type    = number
  default = 1
}

variable "sockets" {
  type    = number
  default = 1
}

variable "disk_size" {
  type    = number
  default = 16
}

variable "bridge" {
  type = string
}

variable "network_model" {
  type    = string
  default = "virtio"
}

variable "cpu_type" {
  type    = string
  default = "host"
}

variable "scsihw" {
  type    = string
  default = "virtio-scsi-single"
}

variable "full_clone" {
  type    = bool
  default = true
}

variable "onboot" {
  type    = bool
  default = true
}

variable "iothread" {
  type    = bool
  default = true
}

variable "machine" {
  type    = string
  default = "q35"
}

variable "bios" {
  type    = string
  default = "seabios"
}

variable "agent" {
  type    = bool
  default = true
}

variable "nameserver" {
  type = string
}

variable "searchdomain" {
  type = string
}

variable "ipv4_address" {
  type = string
}

variable "ipv4_gateway" {
  type = string
}

variable "ssh_public_key" {
  type = string
}
