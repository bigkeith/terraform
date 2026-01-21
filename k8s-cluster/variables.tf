variable "pm_api_url" {
  description = "The API URL for Proxmox (e.g., https://192.168.1.100:8006/api2/json)"
  type        = string
}

variable "pm_api_token_id" {
  description = "The token ID (e.g., terraform@pve!token-name)"
  type        = string
  sensitive   = true
}

variable "pm_api_token_secret" {
  description = "The token secret UUID"
  type        = string
  sensitive   = true
}

variable "pm_tls_insecure" {
  description = "Whether to skip TLS verification"
  type        = bool
  default     = true
}

variable "ssh_public_key" {
  description = "ssh pub key"
  type        = string
  sensitive   = true
}
