locals {

  cloudinit = {
    nameserver   = "192.168.0.103"
    searchdomain = "diego.home"
  }

  # LXC containers
  containers = {

    nginx = {
      hostname   = "nginx"
      vmid       = 101
      ostemplate = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"

      memory    = 512
      cores     = 1
      disk_size = 4

      ip      = "192.168.0.101/24"
      gateway = "192.168.0.1"

      onboot = false
    }

    docker = {
      hostname   = "docker"
      vmid       = 102
      ostemplate = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"

      memory    = 768
      cores     = 2
      disk_size = 10

      ip      = "192.168.0.102/24"
      gateway = "192.168.0.1"

      onboot = false
    }

    dns = {
      hostname   = "dns"
      vmid       = 103
      ostemplate = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"

      memory    = 512
      cores     = 1
      disk_size = 4

      ip      = "192.168.0.103/24"
      gateway = "192.168.0.1"

      onboot = true
    }
  }

  # VMs (KVM)
  vms = {

    centos = {
      name       = "centos"
      vmid       = 150
      clone_vmid = 301
      memory     = 2048
      cores      = 2
      disk_size  = 16
      onboot     = false

      ipv4_address = "192.168.0.150/24"
      ipv4_gateway = "192.168.0.1"
    }

    pg-node-01 = {
      name       = "pg-node-01"
      vmid       = 151
      clone_vmid = 300
      memory     = 2048
      cores      = 1
      disk_size  = 16
      onboot     = false

      ipv4_address = "192.168.0.151/24"
      ipv4_gateway = "192.168.0.1"
    }

    pg-node-02 = {
      name       = "pg-node-02"
      vmid       = 152
      clone_vmid = 300
      memory     = 2048
      cores      = 1
      disk_size  = 16
      onboot     = false

      ipv4_address = "192.168.0.152/24"
      ipv4_gateway = "192.168.0.1"
    }

    pg-node-03 = {
      name       = "pg-node-03"
      vmid       = 153
      clone_vmid = 300
      memory     = 2048
      cores      = 1
      disk_size  = 16
      onboot     = false

      ipv4_address = "192.168.0.153/24"
      ipv4_gateway = "192.168.0.1"
    }

    gitlab = {
      name       = "gitlab"
      vmid       = 154
      clone_vmid = 300
      memory     = 8192
      cores      = 2
      disk_size  = 50
      onboot     = false

      ipv4_address = "192.168.0.154/24"
      ipv4_gateway = "192.168.0.1"
    }

    k3s-master-01 = {
      name       = "k3s-master-01"
      vmid       = 155
      clone_vmid = 300
      memory     = 4096
      cores      = 2
      disk_size  = 20
      onboot     = false

      ipv4_address = "192.168.0.155/24"
      ipv4_gateway = "192.168.0.1"
    }

    k3s-worker-01 = {
      name       = "k3s-worker-01"
      vmid       = 156
      clone_vmid = 300
      memory     = 4096
      cores      = 2
      disk_size  = 20
      onboot     = false

      ipv4_address = "192.168.0.156/24"
      ipv4_gateway = "192.168.0.1"
    }
  }
}

