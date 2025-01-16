terraform {
  required_providers {
    aci = {
      source = "CiscoDevNet/aci"
    }
  }
}

provider "aci" {
  username = var.apic_user
  password = var.apic_pass
  url      = var.apic_url
  insecure = true
}

module "aci" {
  source  = "netascode/nac-aci/aci"
  version = "0.9.2"

  yaml_directories = ["data"]

  manage_access_policies    = true
  manage_fabric_policies    = false
  manage_pod_policies       = false
  manage_node_policies      = false
  manage_interface_policies = false
  manage_tenants            = true
}