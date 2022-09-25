<!-- BEGIN_TF_DOCS -->
# BIOS Policy Example

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example will create resources. Resources can be destroyed with `terraform destroy`.

### main.tf
```hcl
module "m5_bios" {
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

module "m6_bios" {
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
```

### provider.tf
```hcl
terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">=1.0.32"
    }
  }
  required_version = ">=1.3.0"
}
```

### variables.tf
```hcl
variable "apikey" {
  description = "Intersight API Key."
  sensitive   = true
  type        = string
}

variable "endpoint" {
  default     = "https://intersight.com"
  description = "Intersight URL."
  type        = string
}

variable "secretkey" {
  description = "Intersight Secret Key."
  sensitive   = true
  type        = string
}
```
<!-- END_TF_DOCS -->