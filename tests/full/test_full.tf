terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">=1.0.32"
    }
  }
}

# Setup provider, variables and outputs
provider "intersight" {
  apikey    = var.intersight_keyid
  secretkey = file(var.intersight_secretkeyfile)
  endpoint  = var.intersight_endpoint
}

variable "intersight_keyid" {}
variable "intersight_secretkeyfile" {}
variable "intersight_endpoint" {
  default = "intersight.com"
}
variable "name" {}

output "moid" {
  value = module.main.moid
}

# This is the module under test
module "main" {
  source        = "../.."
  bios_template = "M6_Virtualization_tpm"
  description   = "${var.name} BIOS Policy."
  name          = var.name
  organization  = "default"
  # BIOS Customization
  baud_rate           = "115200"
  console_redirection = "serial-port-a"
  execute_disable_bit = "disabled"
  lv_ddr_mode         = "auto"
  serial_port_aenable = "enabled"
  terminal_type       = "vt100"
}
