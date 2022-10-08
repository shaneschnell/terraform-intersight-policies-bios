module "main" {
  source        = "../.."
  bios_template = "M6_Virtualization_tpm"
  description   = "${var.name} BIOS Policy."
  name          = var.name
  organization  = "terratest"
  # BIOS Customization
  baud_rate           = "115200"
  console_redirection = "serial-port-a"
  execute_disable_bit = "disabled"
  lv_ddr_mode         = "auto"
  serial_port_aenable = "enabled"
  terminal_type       = "vt100"
}
