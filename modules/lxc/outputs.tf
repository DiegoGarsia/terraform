output "id" {
  value = proxmox_virtual_environment_container.container.id
}

output "vmid" {
  value = proxmox_virtual_environment_container.container.vm_id
}

output "hostname" {
  value = var.hostname
}
