# WebServer1 Compute

resource "oci_core_instance" "FoggyKitchenWebserver1" {
  provider            = oci.region1
  availability_domain = var.availablity_domain_name1 == "" ? lookup(data.oci_identity_availability_domains.region1-ADs.availability_domains[0], "name") : var.availablity_domain_name1
  compartment_id      = oci_identity_compartment.FoggyKitchenCompartment.id
  display_name        = "FoggyKitchenWebServer1"
  shape               = var.Shape
  dynamic "shape_config" {
    for_each = local.is_flexible_shape ? [1] : []
    content {
      memory_in_gbs = var.FlexShapeMemory
      ocpus         = var.FlexShapeOCPUS
    }
  }
  fault_domain = "FAULT-DOMAIN-1"
  source_details {
    source_type = "image"
    source_id   = lookup(data.oci_core_images.region1-OSImage.images[0], "id")
  }
  metadata = {
    ssh_authorized_keys = tls_private_key.public_private_key_pair.public_key_openssh
  }
  create_vnic_details {
    subnet_id        = oci_core_subnet.FoggyKitchenWebSubnet1.id
    assign_public_ip = true
    nsg_ids          = [oci_core_network_security_group.FoggyKitchenWebSecurityGroup1.id]
  }
}

# WebServer2 Compute

resource "oci_core_instance" "FoggyKitchenWebserver2" {
  provider            = oci.region2
  availability_domain = var.availablity_domain_name2 == "" ? lookup(data.oci_identity_availability_domains.region2-ADs.availability_domains[0], "name") : var.availablity_domain_name2
  compartment_id      = oci_identity_compartment.FoggyKitchenCompartment.id
  display_name        = "FoggyKitchenWebServer2"
  shape               = var.Shape
  dynamic "shape_config" {
    for_each = local.is_flexible_shape ? [1] : []
    content {
      memory_in_gbs = var.FlexShapeMemory
      ocpus         = var.FlexShapeOCPUS
    }
  }
  fault_domain = "FAULT-DOMAIN-1"
  source_details {
    source_type = "image"
    source_id   = lookup(data.oci_core_images.region2-OSImage.images[0], "id")
  }
  metadata = {
    ssh_authorized_keys = tls_private_key.public_private_key_pair.public_key_openssh
  }
  create_vnic_details {
    subnet_id        = oci_core_subnet.FoggyKitchenWebSubnet2.id
    assign_public_ip = true
    nsg_ids          = [oci_core_network_security_group.FoggyKitchenWebSecurityGroup2.id]
  }
}

# WebServer3 Compute

resource "oci_core_instance" "FoggyKitchenWebserver3" {
  provider            = oci.region3
  availability_domain = var.availablity_domain_name3 == "" ? lookup(data.oci_identity_availability_domains.region3-ADs.availability_domains[0], "name") : var.availablity_domain_name3
  compartment_id      = oci_identity_compartment.FoggyKitchenCompartment.id
  display_name        = "FoggyKitchenWebServer3"
  shape               = var.Shape
  dynamic "shape_config" {
    for_each = local.is_flexible_shape ? [1] : []
    content {
      memory_in_gbs = var.FlexShapeMemory
      ocpus         = var.FlexShapeOCPUS
    }
  }
  fault_domain = "FAULT-DOMAIN-1"
  source_details {
    source_type = "image"
    source_id   = lookup(data.oci_core_images.region3-OSImage.images[0], "id")
  }
  metadata = {
    ssh_authorized_keys = tls_private_key.public_private_key_pair.public_key_openssh
  }
  create_vnic_details {
    subnet_id        = oci_core_subnet.FoggyKitchenWebSubnet3.id
    assign_public_ip = true
    nsg_ids          = [oci_core_network_security_group.FoggyKitchenWebSecurityGroup3.id]
  }
}