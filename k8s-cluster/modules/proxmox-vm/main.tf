terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.2-rc07" # Match the version in your root providers.tf
    }
  }
}

resource "proxmox_vm_qemu" "vm" {
  name        = var.vm_name
  target_node = var.target_node
  vmid        = var.vmid
  clone       = var.template_name
  agent   = 1
  cores   = var.cores
  memory  = var.memory
  scsihw = "virtio-scsi-pci"
  boot    = "order=scsi0"
  ipconfig0 = "ip=${var.ip_address},gw=${var.gateway}"

  disk {
    slot    = "scsi0"
    type    = "disk"
    storage = var.storage_pool
    size    = var.disk_size
  }

  # Add the Cloud-Init drive (required for boot)
  disk {
    slot    = "ide2"
    type    = "cloudinit"
    storage = var.storage_pool
  }

  os_type   = "cloud-init"
  #ipconfig0 = "ip=dhcp"
  sshkeys   = var.ssh_key

#network device
network {
    id = 0
    bridge = var.network_bridge
    model  = "virtio"
  }

}