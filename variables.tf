variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "compartment_ocid" {}
variable "region" {}
variable "ATP_password" {}

variable "availablity_domain_name1" {
  default = ""
}

variable "availablity_domain_name2" {
  default = ""
}

variable "availablity_domain_name3" {
  default = ""
}

variable "region1" {
  default = "eu-frankfurt-1"
}

variable "region2" {
  default = "eu-amsterdam-1"
}

variable "region3" {
  default = "us-ashburn-1"
}

# VCNs CIDRs

# region1

variable "Web-VCN1-CIDR" {
  default = "10.1.1.0/24"
}

variable "ATP-VCN1-CIDR" {
  default = "10.1.2.0/24"
}

# region2

variable "Web-VCN2-CIDR" {
  default = "172.16.1.0/24"
}

variable "ATP-VCN2-CIDR" {
  default = "172.16.2.0/24"
}

# region3

variable "Web-VCN3-CIDR" {
  default = "192.168.1.0/24"
}

variable "ATP-VCN3-CIDR" {
  default = "192.168.2.0/24"
}

# Subnet CIDRs

# region1

variable "Web-Subnet1-CIDR" {
  default = "10.1.1.0/24"
}

variable "ATP-Subnet1-CIDR" {
  default = "10.1.2.0/24"
}

# region2

variable "Web-Subnet2-CIDR" {
  default = "172.16.1.0/24"
}

variable "ATP-Subnet2-CIDR" {
  default = "172.16.2.0/24"
}

# region3

variable "Web-Subnet3-CIDR" {
  default = "192.168.1.0/24"
}

variable "ATP-Subnet3-CIDR" {
  default = "192.168.2.0/24"
}

variable "Shape" {
  default = "VM.Standard.E4.Flex"
}

variable "FlexShapeOCPUS" {
  default = 1
}

variable "FlexShapeMemory" {
  default = 1
}

variable "instance_os" {
  default = "Oracle Linux"
}

variable "instance_name1" {
  default = "FoggyKitchenWebServer1"
}

variable "instance_name2" {
  default = "FoggyKitchenWebServer2"
}

variable "instance_name3" {
  default = "FoggyKitchenWebServer3"
}

variable "linux_os_version" {
  default = "8"
}

variable "webservice_ports" {
  default = ["80", "443"]
}

variable "bastion_ports" {
  default = ["22"]
}

# Dictionary Locals
locals {
  compute_flexible_shapes = [
    "VM.Standard.E3.Flex",
    "VM.Standard.E4.Flex"
  ]
}

# Checks if is using Flexible Compute Shapes
locals {
  is_flexible_shape    = contains(local.compute_flexible_shapes, var.Shape)
}

variable "ATP_database_cpu_core_count" {
  default = 1
}

variable "ATP_database_data_storage_size_in_tbs" {
  default = 1
}

variable "ATP_database_db_name1" {
  default = "atppriv1"
}

variable "ATP_database_db_name2" {
  default = "atppriv2"
}

variable "ATP_database_db_name3" {
  default = "atppriv3"
}

variable "ATP_database_db_version" {
  default = "19c"
}

variable "ATP_database_defined_tags_value" {
  default = ""
}

variable "ATP_database_display_name1" {
  default = "FoggyKitchenATP1"
}

variable "ATP_database_display_name2" {
  default = "FoggyKitchenATP2"
}

variable "ATP_database_display_name3" {
  default = "FoggyKitchenATP3"
}

variable "ATP_database_freeform_tags" {
  default = {
    "Owner" = "FoggyKitchenATP"
  }
}

variable "ATP_tde_wallet_zip_file1" {
  default = "tde_wallet_atppriv1.zip"
}

variable "ATP_tde_wallet_zip_file2" {
  default = "tde_wallet_atppriv2.zip"
}

variable "ATP_tde_wallet_zip_file3" {
  default = "tde_wallet_atppriv3.zip"
}

variable "ATP_database_license_model" {
  default = "LICENSE_INCLUDED"
}

variable "ATP_wallet_password_specials" {
  default = true
}

variable "ATP_wallet_password_length" {
  default = 16
}

variable "ATP_wallet_password_min_numeric" {
  default = 2
}

variable "ATP_wallet_password_override_special" {
  default = ""
}

variable "oracle_instant_client_version" {
  default = "19.10"
}

variable "oracle_instant_client_version_short" {
  default = "19.10"
}

variable "enable_dns" {
  default = true
}

variable "dns_domain" {
  default = "mydomain.xyz"
}

variable "dns_a_record_ttl" {
  default = 30
}

variable "steering_policy_ttl" {
  default = 60
}

