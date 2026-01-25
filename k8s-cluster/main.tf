# Create 1 Control Plane Node
module "control_plane" {
  source      = "./modules/proxmox-vm"
  vm_name     = "k8s-master"
  vmid        = 500
  cores       = 2
  memory      = 4096
  ssh_key     = var.ssh_public_key
  storage_pool = "datastoreHDD1"
  disk_size   = 20
  template_name = "ubuntu-cloud-template"
  ip_address = "192.168.1.150/24"
  
  
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
  disk_size   = 20
  storage_pool = "datastoreHDD1"
  template_name = "ubuntu-cloud-template"
  ip_address = "192.168.1.${151 + count.index}/24"
}

# Create 1 single Node cluster lab
module "lab" {
  source      = "./modules/proxmox-vm"
  count       = 1
  vm_name     = "lab01"
  vmid        = 800 
  cores       = 4
  memory      = 2048
  ssh_key     = var.ssh_public_key
  disk_size   = 20
  storage_pool = "datastoreHDD1"
  template_name = "ubuntu-cloud-template"
  ip_address = "192.168.1.${151 + count.index}/24"
}
