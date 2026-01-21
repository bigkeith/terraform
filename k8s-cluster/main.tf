# Create 1 Control Plane Node
module "control_plane" {
  source      = "./modules/proxmox-vm"
  vm_name     = "k8s-master"
  vmid        = 500
  cores       = 2
  memory      = 4096
  ssh_key     = var.ssh_public_key
  # ... other variables
}

# Create 3 Worker Nodes
module "workers" {
  source      = "./modules/proxmox-vm"
  count       = 3
  vm_name     = "k8s-worker-${count.index}"
  vmid        = 600 + count.index
  cores       = 4
  memory      = 4096
  ssh_key     = var.ssh_public_key
}