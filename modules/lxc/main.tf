resource "proxmox_virtual_environment_container" "container" {

  node_name = var.node

  vm_id = var.vmid

  started = var.start

  unprivileged = var.unprivileged


  initialization {

    hostname = var.hostname

    dns {
      servers = [
        var.nameserver
      ]
    }

    ip_config {

      ipv4 {
        address = var.ip
        gateway = var.gateway
      }

    }

    user_account {

      password = var.password

      keys = [
        var.ssh_public_key
      ]

    }

  }


  cpu {

    cores = var.cores

    units = var.cpuunits

    limit = var.cpulimit

  }


  memory {

    dedicated = var.memory

    swap = var.swap

  }


  disk {

    datastore_id = var.storage

    size = var.disk_size

  }


  network_interface {

    name = var.network_name

    bridge = var.bridge

  }


  features {

    nesting = var.nesting

  }


  operating_system {

    type = "ubuntu"

    template_file_id = var.ostemplate

  }

}
