# Home Region Subscription DataSource
data "oci_identity_region_subscriptions" "home_region_subscriptions" {
  tenancy_id = var.tenancy_ocid

  filter {
    name   = "is_home_region"
    values = [true]
  }
}

# Gets a list of Availability Domains in region1
data "oci_identity_availability_domains" "region1-ADs" {
  provider       = oci.region1
  compartment_id = var.tenancy_ocid
}

# Gets a list of Availability Domains in region2
data "oci_identity_availability_domains" "region2-ADs" {
  provider       = oci.region2
  compartment_id = var.tenancy_ocid
}


# Gets a list of Availability Domains in region3
data "oci_identity_availability_domains" "region3-ADs" {
  provider       = oci.region3
  compartment_id = var.tenancy_ocid
}

# Images DataSource in region1
data "oci_core_images" "region1-OSImage" {
  provider                 = oci.region1
  compartment_id           = var.compartment_ocid
  operating_system         = var.instance_os
  operating_system_version = var.linux_os_version
  shape                    = var.Shape

  filter {
    name   = "display_name"
    values = ["^.*Oracle[^G]*$"]
    regex  = true
  }
}

# Images DataSource in region2
data "oci_core_images" "region2-OSImage" {
  provider                 = oci.region2
  compartment_id           = var.compartment_ocid
  operating_system         = var.instance_os
  operating_system_version = var.linux_os_version
  shape                    = var.Shape

  filter {
    name   = "display_name"
    values = ["^.*Oracle[^G]*$"]
    regex  = true
  }
}

# Images DataSource in region3
data "oci_core_images" "region3-OSImage" {
  provider                 = oci.region3
  compartment_id           = var.compartment_ocid
  operating_system         = var.instance_os
  operating_system_version = var.linux_os_version
  shape                    = var.Shape

  filter {
    name   = "display_name"
    values = ["^.*Oracle[^G]*$"]
    regex  = true
  }
}




