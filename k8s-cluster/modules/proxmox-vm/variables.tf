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
# ... Add any other arguments you used in main.tf (cores, memory, etc.)