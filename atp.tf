# ATP1 (region1)

resource "oci_database_autonomous_database" "atp1" {
  provider                 = oci.region1
  admin_password           = var.ATP_password
  compartment_id           = oci_identity_compartment.FoggyKitchenCompartment.id
  cpu_core_count           = var.ATP_database_cpu_core_count
  data_storage_size_in_tbs = var.ATP_database_data_storage_size_in_tbs
  db_name                  = var.ATP_database_db_name1
  db_version               = var.ATP_database_db_version
  db_workload              = "OLTP"
  display_name             = var.ATP_database_display_name1
  license_model            = var.ATP_database_license_model
  nsg_ids                  = [oci_core_network_security_group.FoggyKitchenATPSecurityGroup1.id]
  private_endpoint_label   = true
  subnet_id                = oci_core_subnet.FoggyKitchenATPSubnet1.id
  lifecycle {
    ignore_changes = [defined_tags["Oracle-Tags.CreatedBy"], defined_tags["Oracle-Tags.CreatedOn"]]
  }
}

# ATP2 (region2)

resource "oci_database_autonomous_database" "atp2" {
  provider                 = oci.region2
  admin_password           = var.ATP_password
  compartment_id           = oci_identity_compartment.FoggyKitchenCompartment.id
  cpu_core_count           = var.ATP_database_cpu_core_count
  data_storage_size_in_tbs = var.ATP_database_data_storage_size_in_tbs
  db_name                  = var.ATP_database_db_name2
  db_version               = var.ATP_database_db_version
  db_workload              = "OLTP"
  display_name             = var.ATP_database_display_name2
  license_model            = var.ATP_database_license_model
  nsg_ids                  = [oci_core_network_security_group.FoggyKitchenATPSecurityGroup2.id]
  private_endpoint_label   = true
  subnet_id                = oci_core_subnet.FoggyKitchenATPSubnet2.id
  lifecycle {
    ignore_changes = [defined_tags["Oracle-Tags.CreatedBy"], defined_tags["Oracle-Tags.CreatedOn"]]
  }
}

# ATP2 (region3)

resource "oci_database_autonomous_database" "atp3" {
  provider                 = oci.region3
  admin_password           = var.ATP_password
  compartment_id           = oci_identity_compartment.FoggyKitchenCompartment.id
  cpu_core_count           = var.ATP_database_cpu_core_count
  data_storage_size_in_tbs = var.ATP_database_data_storage_size_in_tbs
  db_name                  = var.ATP_database_db_name3
  db_version               = var.ATP_database_db_version
  db_workload              = "OLTP"
  display_name             = var.ATP_database_display_name3
  license_model            = var.ATP_database_license_model
  nsg_ids                  = [oci_core_network_security_group.FoggyKitchenATPSecurityGroup3.id]
  private_endpoint_label   = true
  subnet_id                = oci_core_subnet.FoggyKitchenATPSubnet3.id
  lifecycle {
    ignore_changes = [defined_tags["Oracle-Tags.CreatedBy"], defined_tags["Oracle-Tags.CreatedOn"]]
  }
}
