# IAM Region1 Group

resource "oci_identity_group" "FoggyKitchenRegion1Group" {
  provider       = oci.homeregion
  compartment_id = var.tenancy_ocid
  name           = "FoggyKitchenRegion1Group"
  description    = "FoggyKitchenRegion1Group"
}

# IAM Region1 Policy

resource "oci_identity_policy" "FoggyKitchenRegion1Policy" {
  provider       = oci.homeregion
  name           = "FoggyKitchenRegion1Policy"
  description    = "FoggyKitchenRegion1Policy"
  compartment_id = var.tenancy_ocid

  statements = ["Allow group ${oci_identity_group.FoggyKitchenRegion1Group.name} to manage virtual-network-family in compartment id ${oci_identity_compartment.FoggyKitchenCompartment.id}",
    "Allow group ${oci_identity_group.FoggyKitchenRegion1Group.name} to manage instance-family in compartment id ${oci_identity_compartment.FoggyKitchenCompartment.id}",
    "Allow group ${oci_identity_group.FoggyKitchenRegion1Group.name} to manage remote-peering-from in compartment id ${oci_identity_compartment.FoggyKitchenCompartment.id}",
  ]
}

# IAM Region2 Group

resource "oci_identity_group" "FoggyKitchenRegion2Group" {
  provider       = oci.homeregion
  compartment_id = var.tenancy_ocid
  name           = "FoggyKitchenRegion2Group"
  description    = "FoggyKitchenRegion2Group"
}

# IAM Region2 Policy

resource "oci_identity_policy" "FoggyKitchenRegion2Policy" {
  provider       = oci.homeregion
  name           = "FoggyKitchenRegion2Policy"
  description    = "FoggyKitchenRegion2Policy"
  compartment_id = var.tenancy_ocid

  statements = ["Allow group ${oci_identity_group.FoggyKitchenRegion2Group.name} to manage remote-peering-to in compartment id ${oci_identity_compartment.FoggyKitchenCompartment.id}",
    "Allow group ${oci_identity_group.FoggyKitchenRegion2Group.name} to manage virtual-network-family in compartment id ${oci_identity_compartment.FoggyKitchenCompartment.id}",
    "Allow group ${oci_identity_group.FoggyKitchenRegion2Group.name} to manage instance-family in compartment id ${oci_identity_compartment.FoggyKitchenCompartment.id}",
  ]
}


# IAM Region3 Group

resource "oci_identity_group" "FoggyKitchenRegion3Group" {
  provider       = oci.homeregion
  compartment_id = var.tenancy_ocid
  name           = "FoggyKitchenRegion3Group"
  description    = "FoggyKitchenRegion3Group"
}

# IAM Region3 Policy

resource "oci_identity_policy" "FoggyKitchenRegion3Policy" {
  provider       = oci.homeregion
  name           = "FoggyKitchenRegion3Policy"
  description    = "FoggyKitchenRegion3Policy"
  compartment_id = var.tenancy_ocid

  statements = ["Allow group ${oci_identity_group.FoggyKitchenRegion3Group.name} to manage remote-peering-to in compartment id ${oci_identity_compartment.FoggyKitchenCompartment.id}",
    "Allow group ${oci_identity_group.FoggyKitchenRegion3Group.name} to manage virtual-network-family in compartment id ${oci_identity_compartment.FoggyKitchenCompartment.id}",
    "Allow group ${oci_identity_group.FoggyKitchenRegion3Group.name} to manage instance-family in compartment id ${oci_identity_compartment.FoggyKitchenCompartment.id}",
  ]
}

