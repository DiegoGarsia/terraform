resource "proxmox_virtual_environment_vm" "vm" {

  name      = var.name
  node_name = var.node
  vm_id     = var.vmid

  started = var.onboot

  clone {
    vm_id = var.clone_vmid
    full  = var.full_clone
  }

  agent {
    enabled = var.agent
  }

  cpu {
    cores   = var.cores
    sockets = var.sockets
    type    = var.cpu_type
  }

  memory {
    dedicated = var.memory
  }

  machine = var.machine

  scsi_hardware = var.scsihw

  disk {

    datastore_id = var.storage

    interface = "scsi0"

    size = var.disk_size

    iothread = var.iothread

  }

  network_device {

    bridge = var.bridge

    model = var.network_model

  }

  initialization {

    dns {

      domain = var.searchdomain

      servers = [
        var.nameserver
      ]

    }

    ip_config {

      ipv4 {

        address = var.ipv4_address
        gateway = var.ipv4_gateway

      }

    }

    user_account {

      username = "ubuntu"

      keys = [
        var.ssh_public_key
      ]

    }

  }

  operating_system {
    type = "l26"
  }

  bios = var.bios

  boot_order = [
    "scsi0"
  ]

}
