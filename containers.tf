module "lxc" {

  for_each = local.containers

  source = "./modules/lxc"

  node = var.node

  hostname = each.value.hostname
  vmid     = each.value.vmid

  ostemplate = each.value.ostemplate

  ssh_public_key = var.ssh_public_key
  password       = var.lxc_password

  memory   = each.value.memory
  cores    = each.value.cores
  cpuunits = try(each.value.cpuunits, 1024)
  cpulimit = try(each.value.cpulimit, 0)
  swap     = try(each.value.swap, 0)

  storage   = var.storage
  disk_size = each.value.disk_size

  bridge       = var.bridge
  network_name = try(each.value.network_name, "eth0")

  ip         = each.value.ip
  gateway    = each.value.gateway
  nameserver = local.cloudinit.nameserver

  start        = true
  onboot       = each.value.onboot
  unprivileged = try(each.value.unprivileged, true)

  nesting = try(each.value.nesting, true)

}
