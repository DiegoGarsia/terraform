variable "node" { type = string }

variable "hostname" { type = string }

variable "vmid" { type = number }

variable "ostemplate" { type = string }

variable "ssh_public_key" { type = string }

variable "memory" {
  type    = number
  default = 512
}

variable "cores" {
  type    = number
  default = 1
}

variable "disk_size" {
  type    = number
  default = 4
}

variable "storage" {
  type = string
}

variable "bridge" {
  type = string
}

variable "ip" {
  type = string
}

variable "gateway" {
  type = string
}

variable "nameserver" {
  type = string
}

variable "network_name" {
  type    = string
  default = "eth0"
}

variable "start" {
  type    = bool
  default = true
}

variable "onboot" {
  type    = bool
  default = false
}

variable "unprivileged" {
  type    = bool
  default = true
}

variable "nesting" {
  type    = bool
  default = true
}

variable "swap" {
  type    = number
  default = 0
}

variable "cpuunits" {
  type    = number
  default = 1024
}

variable "cpulimit" {
  type    = number
  default = 0
}

variable "password" {
  type      = string
  sensitive = true
}
