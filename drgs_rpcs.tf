# DRG1 (Region1)
resource "oci_core_drg" "FoggyKitchenDRG1" {
  depends_on     = [oci_identity_policy.FoggyKitchenRegion1Policy]
  provider       = oci.region1
  display_name   = "FoggyKitchenDRG1"
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
}

# DRG1 Attachment with WebVCN1 (Region1)
resource "oci_core_drg_attachment" "FoggyKitchenDRG1AttachmentWebVCN1" {
  depends_on = [oci_identity_policy.FoggyKitchenRegion1Policy]
  provider   = oci.region1
  drg_id     = oci_core_drg.FoggyKitchenDRG1.id
  vcn_id     = oci_core_virtual_network.FoggyKitchenWebVCN1.id
}

# DRG1 Attachment with ATPVCN1 (Region1)
resource "oci_core_drg_attachment" "FoggyKitchenDRG1AttachmentATPVCN1" {
  depends_on = [oci_identity_policy.FoggyKitchenRegion1Policy]
  provider   = oci.region1
  drg_id     = oci_core_drg.FoggyKitchenDRG1.id
  vcn_id     = oci_core_virtual_network.FoggyKitchenATPVCN1.id
}

# RPC11 towards Region2 for DRG1 (Region1)
resource "oci_core_remote_peering_connection" "FoggyKitchenRPC12" {
  depends_on       = [oci_identity_policy.FoggyKitchenRegion1Policy]
  provider         = oci.region1
  compartment_id   = oci_identity_compartment.FoggyKitchenCompartment.id
  drg_id           = oci_core_drg.FoggyKitchenDRG1.id
  display_name     = "FoggyKitchenRPC12"
  peer_id          = oci_core_remote_peering_connection.FoggyKitchenRPC21.id
  peer_region_name = var.region2
}

# RPC13 towards Region3 for DRG1 (Region1)
resource "oci_core_remote_peering_connection" "FoggyKitchenRPC13" {
  depends_on       = [oci_identity_policy.FoggyKitchenRegion1Policy]
  provider         = oci.region1
  compartment_id   = oci_identity_compartment.FoggyKitchenCompartment.id
  drg_id           = oci_core_drg.FoggyKitchenDRG1.id
  display_name     = "FoggyKitchenRPC13"
  peer_id          = oci_core_remote_peering_connection.FoggyKitchenRPC31.id
  peer_region_name = var.region3
}

# DRG2 (Region2)
resource "oci_core_drg" "FoggyKitchenDRG2" {
  depends_on     = [oci_identity_policy.FoggyKitchenRegion2Policy]
  provider       = oci.region2
  display_name   = "FoggyKitchenDRG2"
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
}

# DRG2 Attachment with WebVCN2 (Region2)
resource "oci_core_drg_attachment" "FoggyKitchenDRG2AttachmentWebVCN2" {
  depends_on = [oci_identity_policy.FoggyKitchenRegion2Policy]
  provider   = oci.region2
  drg_id     = oci_core_drg.FoggyKitchenDRG2.id
  vcn_id     = oci_core_virtual_network.FoggyKitchenWebVCN2.id
}

# DRG2 Attachment with ATPVCN2 (Region2)
resource "oci_core_drg_attachment" "FoggyKitchenDRG2AttachmentATPVCN2" {
  depends_on = [oci_identity_policy.FoggyKitchenRegion2Policy]
  provider   = oci.region2
  drg_id     = oci_core_drg.FoggyKitchenDRG2.id
  vcn_id     = oci_core_virtual_network.FoggyKitchenATPVCN2.id
}

# RPC21 towards Region2 for DRG2 (Region2)
resource "oci_core_remote_peering_connection" "FoggyKitchenRPC21" {
  depends_on       = [oci_identity_policy.FoggyKitchenRegion2Policy]
  provider         = oci.region2
  compartment_id   = oci_identity_compartment.FoggyKitchenCompartment.id
  drg_id           = oci_core_drg.FoggyKitchenDRG2.id
  display_name     = "FoggyKitchenRPC21"
}

# RPC23 towards Region3 for DRG1 (Region2)
resource "oci_core_remote_peering_connection" "FoggyKitchenRPC23" {
  depends_on       = [oci_identity_policy.FoggyKitchenRegion2Policy]
  provider         = oci.region2
  compartment_id   = oci_identity_compartment.FoggyKitchenCompartment.id
  drg_id           = oci_core_drg.FoggyKitchenDRG2.id
  display_name     = "FoggyKitchenRPC23"
  peer_id          = oci_core_remote_peering_connection.FoggyKitchenRPC32.id
  peer_region_name = var.region3
}

# DRG3 (Region3)
resource "oci_core_drg" "FoggyKitchenDRG3" {
  depends_on     = [oci_identity_policy.FoggyKitchenRegion3Policy]
  provider       = oci.region3
  display_name   = "FoggyKitchenDRG3"
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
}

# DRG3 Attachment with WebVCN3 (Region3)
resource "oci_core_drg_attachment" "FoggyKitchenDRG3AttachmentWebVCN2" {
  depends_on = [oci_identity_policy.FoggyKitchenRegion3Policy]
  provider   = oci.region3
  drg_id     = oci_core_drg.FoggyKitchenDRG3.id
  vcn_id     = oci_core_virtual_network.FoggyKitchenWebVCN3.id
}

# DRG3 Attachment with ATPVCN3 (Region3)
resource "oci_core_drg_attachment" "FoggyKitchenDRG3AttachmentATPVCN2" {
  depends_on = [oci_identity_policy.FoggyKitchenRegion3Policy]
  provider   = oci.region3
  drg_id     = oci_core_drg.FoggyKitchenDRG3.id
  vcn_id     = oci_core_virtual_network.FoggyKitchenATPVCN3.id
}

# RPC31 towards Region2 for DRG3 (Region3)
resource "oci_core_remote_peering_connection" "FoggyKitchenRPC31" {
  depends_on       = [oci_identity_policy.FoggyKitchenRegion3Policy]
  provider         = oci.region3
  compartment_id   = oci_identity_compartment.FoggyKitchenCompartment.id
  drg_id           = oci_core_drg.FoggyKitchenDRG3.id
  display_name     = "FoggyKitchenRPC31"
}

# RPC32 towards Region3 for DRG3 (Region3)
resource "oci_core_remote_peering_connection" "FoggyKitchenRPC32" {
  depends_on       = [oci_identity_policy.FoggyKitchenRegion3Policy]
  provider         = oci.region3
  compartment_id   = oci_identity_compartment.FoggyKitchenCompartment.id
  drg_id           = oci_core_drg.FoggyKitchenDRG3.id
  display_name     = "FoggyKitchenRPC32"
}


