# Define the required providers and their versions

# We specify the 'telmate/proxmox' provider which uses the pm_* syntax.

terraform {

  required_providers {

    proxmox = {

      source  = "telmate/proxmox"

      version = "3.0.2-rc07" # Use a specific version for consistency, or a range.

    }

  }

}



# Configure the Proxmox provider

# These are the arguments that were causing the errors before.

# They are correct for the 'telmate/proxmox' provider.

provider "proxmox" {

  pm_api_url          = var.pm_api_url

  pm_api_token_id     = var.pm_api_token_id

  pm_api_token_secret = var.pm_api_token_secret

  pm_tls_insecure     = var.pm_tls_insecure
}