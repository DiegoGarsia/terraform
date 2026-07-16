module "vm" {

  for_each = local.vms

  source = "./modules/vm"

  node = var.node

  name = each.value.name
  vmid = each.value.vmid

  clone_vmid = each.value.clone_vmid
  full_clone = true

  memory  = each.value.memory
  cores   = each.value.cores
  sockets = 1

  cpu_type = "x86-64-v2-AES"

  machine = "q35"

  bios = "seabios"

  scsihw = "virtio-scsi-single"

  storage   = var.storage
  disk_size = each.value.disk_size

  bridge = var.bridge

  network_model = "virtio"

  onboot = each.value.onboot

  nameserver   = local.cloudinit.nameserver
  searchdomain = local.cloudinit.searchdomain

  ipv4_address = each.value.ipv4_address
  ipv4_gateway = each.value.ipv4_gateway

  ssh_public_key = var.ssh_public_key

}
