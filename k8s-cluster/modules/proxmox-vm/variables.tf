# modules/proxmox-vm/variables.tf

variable "vm_name" {
  description = "The name of the VM"
  type        = string
}

variable "target_node" {
  type    = string
  default = "hype1"
}

variable "vmid" {
  type = number
}

variable "cores" {
   type = number
}

variable "memory" {
   type = number
}

variable "ssh_key" {
   type = string
}

variable "storage_pool"{
   type = string
}
variable "disk_size"{
   type = string
}
variable "template_name" { type = string }

variable "ip_address" {
  description = "The static IP for the VM in CIDR format (e.g. 192.168.1.50/24)"
  type        = string
}

variable "gateway" {
  description = "The default gateway for the VM"
  type        = string
  default     = "192.168.1.254" # Change to your actual gateway
}

variable "network_bridge" {
  description = "The Proxmox network bridge (e.g., vmbr0)"
  type        = string
  default     = "vmbr0"
}
# ... Add any other arguments you used in main.tf (cores, memory, etc.)