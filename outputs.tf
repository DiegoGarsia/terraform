output "containers" {
  value = {
    for name, container in module.lxc :
    name => container.vmid
  }
}

output "virtual_machines" {
  value = {
    for name, vm in module.vm :
    name => vm.vmid
  }
}

