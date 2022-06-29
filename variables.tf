# ---------------------------------------------------------------------------------------------------------------------
#   Resource Group
# ---------------------------------------------------------------------------------------------------------------------

variable "create_resource_group" {
  description = "Do you want the Terraform to Create the Resource Group (true) or use an Existing Resource Group (false)"
  default     = true
}

variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  default     = "ferr-westus-networkinghub00-rg"
}

# ---------------------------------------------------------------------------------------------------------------------
#   Resource Location
# ---------------------------------------------------------------------------------------------------------------------

variable "resource_location" {
  description = "Location of all resources to be created"
  default     = "westus"
}

# ---------------------------------------------------------------------------------------------------------------------
#   Virtual Network
# ---------------------------------------------------------------------------------------------------------------------

variable "create_virtual_network" {
  description = "Terraform to create Virtual Network (true) or use an existing Virtual Networks (false)"
  default     = true
}

variable "virtual_network_name" {
  description = "Name of the Azure Virtual Network"
  default     = "ferr-westus-vnethub00"
}

variable "virtual_network_cidr" {
  description = "Virtual Networks CIDR Block"
  default     = "10.161.88.0/22"
}

# ---------------------------------------------------------------------------------------------------------------------
#   Subnets
# ---------------------------------------------------------------------------------------------------------------------

variable "create_virtual_network_subnets" {
  description = "Terraform to create Virtual Network subnets (true) or use existing subnets (false)"
  default     = true
}

variable "virtual_network_subnets" {
  description = "Subnet Map for Creation"
  default = {
    management = {
      address_prefixes = ["10.161.89.0/28"]
    },
    ha2 = {
      address_prefixes = ["10.161.88.16/28"]
    },
    private = {
      address_prefixes = ["10.161.89.32/28"]
    },
    public = {
      address_prefixes = ["10.161.89.16/28"]
    },
    loadbalancer = {
      address_prefixes = ["10.161.88.64/28"]
    }
  }
}

# Ensure you keep them names vmseries0 and vmseries1 or you will have to change reference in the TF files.
variable "vmseries" {
  description = "Definition of the VM-Series deployments"
  default = {
    vmseries0 = {
      admin_username    = "protera"
      admin_password    = "Test1234!@#$"
      instance_size     = "Standard_DS3_v2"
      # License options "byol", "bundle1", "bundle2"
      license           = "byol"
      version           = "latest"
      management_ip     = "10.161.89.4"
      ha2_ip            = "10.161.88.18"
      private_ip        = "10.161.89.36"
      public_ip         = "10.161.89.18"
      # If not licensing authcode is needed leave this set to a value of a space (ie " ")
      authcodes = " "
    }
  }
}


variable "inbound_tcp_ports" {
  default = [443, 80]
}

variable "inbound_udp_ports" {
  default = [500, 4500]
}
