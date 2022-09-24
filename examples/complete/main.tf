module "m5_bios_policy" {
  source  = "terraform-cisco-modules/policies-bios/intersight"
  version = ">= 1.0.1"

  bios_template = "M5_Virtualization"
  description   = "default M5 BIOS Policy."
  name          = "default"
  organization  = "default"
  # BIOS Customization
  baud_rate           = "115200"
  console_redirection = "serial-port-a"
  execute_disable_bit = "disabled"
  lv_ddr_mode         = "auto"
  serial_port_aenable = "enabled"
  terminal_type       = "vt100"
}

module "m6_bios_policy" {
  source  = "terraform-cisco-modules/policies-bios/intersight"
  version = ">= 1.0.1"

  bios_template = "M6_Virtualization_tpm"
  description   = "default M6 BIOS Policy."
  name          = "default"
  organization  = "default"
  # BIOS Customization
  baud_rate           = "115200"
  console_redirection = "serial-port-a"
  execute_disable_bit = "disabled"
  lv_ddr_mode         = "auto"
  serial_port_aenable = "enabled"
  terminal_type       = "vt100"
}
