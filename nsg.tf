# FoggyKitchenATPSecurityGroup1 (region1)

resource "oci_core_network_security_group" "FoggyKitchenATPSecurityGroup1" {
  provider       = oci.region1
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  display_name   = "ATPSecurityGroup1"
  vcn_id         = oci_core_virtual_network.FoggyKitchenATPVCN1.id
}

# Rules related to ATPSecurityGroup (region1)

# EGRESS

resource "oci_core_network_security_group_security_rule" "FoggyKitchenATPSecurityEgressGroup1Rule1" {
  provider                  = oci.region1
  network_security_group_id = oci_core_network_security_group.FoggyKitchenATPSecurityGroup1.id
  direction                 = "EGRESS"
  protocol                  = "6"
  destination               = var.Web-VCN1-CIDR
  destination_type          = "CIDR_BLOCK"
}

resource "oci_core_network_security_group_security_rule" "FoggyKitchenATPSecurityEgressGroup1Rule2" {
  provider                  = oci.region1
  network_security_group_id = oci_core_network_security_group.FoggyKitchenATPSecurityGroup1.id
  direction                 = "EGRESS"
  protocol                  = "6"
  destination               = var.Web-VCN2-CIDR
  destination_type          = "CIDR_BLOCK"
}

resource "oci_core_network_security_group_security_rule" "FoggyKitchenATPSecurityEgressGroup1Rule3" {
  provider                  = oci.region1
  network_security_group_id = oci_core_network_security_group.FoggyKitchenATPSecurityGroup1.id
  direction                 = "EGRESS"
  protocol                  = "6"
  destination               = var.Web-VCN3-CIDR
  destination_type          = "CIDR_BLOCK"
}

# INGRESS

resource "oci_core_network_security_group_security_rule" "FoggyKitchenATPSecurityIngressGroup1Rule1" {
  provider                  = oci.region1
  network_security_group_id = oci_core_network_security_group.FoggyKitchenATPSecurityGroup1.id
  direction                 = "INGRESS"
  protocol                  = "6"
  source                    = var.Web-VCN1-CIDR
  source_type               = "CIDR_BLOCK"
  tcp_options {
    destination_port_range {
      max = 1522
      min = 1522
    }
  }
}

resource "oci_core_network_security_group_security_rule" "FoggyKitchenATPSecurityIngressGroup1Rule2" {
  provider                  = oci.region1
  network_security_group_id = oci_core_network_security_group.FoggyKitchenATPSecurityGroup1.id
  direction                 = "INGRESS"
  protocol                  = "6"
  source                    = var.Web-VCN2-CIDR
  source_type               = "CIDR_BLOCK"
  tcp_options {
    destination_port_range {
      max = 1522
      min = 1522
    }
  }
}

resource "oci_core_network_security_group_security_rule" "FoggyKitchenATPSecurityIngressGroup1Rule3" {
  provider                  = oci.region1
  network_security_group_id = oci_core_network_security_group.FoggyKitchenATPSecurityGroup1.id
  direction                 = "INGRESS"
  protocol                  = "6"
  source                    = var.Web-VCN3-CIDR
  source_type               = "CIDR_BLOCK"
  tcp_options {
    destination_port_range {
      max = 1522
      min = 1522
    }
  }
}

# FoggyKitchenATPSecurityGroup1 (region2)

resource "oci_core_network_security_group" "FoggyKitchenATPSecurityGroup2" {
  provider       = oci.region2
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  display_name   = "ATPSecurityGroup2"
  vcn_id         = oci_core_virtual_network.FoggyKitchenATPVCN2.id
}

# Rules related to ATPSecurityGroup (region2)

# EGRESS

resource "oci_core_network_security_group_security_rule" "FoggyKitchenATPSecurityEgressGroup2Rule1" {
  provider                  = oci.region2
  network_security_group_id = oci_core_network_security_group.FoggyKitchenATPSecurityGroup2.id
  direction                 = "EGRESS"
  protocol                  = "6"
  destination               = var.Web-VCN1-CIDR
  destination_type          = "CIDR_BLOCK"
}

resource "oci_core_network_security_group_security_rule" "FoggyKitchenATPSecurityEgressGroup2Rule2" {
  provider                  = oci.region2
  network_security_group_id = oci_core_network_security_group.FoggyKitchenATPSecurityGroup2.id
  direction                 = "EGRESS"
  protocol                  = "6"
  destination               = var.Web-VCN2-CIDR
  destination_type          = "CIDR_BLOCK"
}

resource "oci_core_network_security_group_security_rule" "FoggyKitchenATPSecurityEgressGroup2Rule3" {
  provider                  = oci.region2
  network_security_group_id = oci_core_network_security_group.FoggyKitchenATPSecurityGroup2.id
  direction                 = "EGRESS"
  protocol                  = "6"
  destination               = var.Web-VCN3-CIDR
  destination_type          = "CIDR_BLOCK"
}

# INGRESS

resource "oci_core_network_security_group_security_rule" "FoggyKitchenATPSecurityIngressGroup2Rule1" {
  provider                  = oci.region2
  network_security_group_id = oci_core_network_security_group.FoggyKitchenATPSecurityGroup2.id
  direction                 = "INGRESS"
  protocol                  = "6"
  source                    = var.Web-VCN1-CIDR
  source_type               = "CIDR_BLOCK"
  tcp_options {
    destination_port_range {
      max = 1522
      min = 1522
    }
  }
}

resource "oci_core_network_security_group_security_rule" "FoggyKitchenATPSecurityIngressGroup2Rule2" {
  provider                  = oci.region2
  network_security_group_id = oci_core_network_security_group.FoggyKitchenATPSecurityGroup2.id
  direction                 = "INGRESS"
  protocol                  = "6"
  source                    = var.Web-VCN2-CIDR
  source_type               = "CIDR_BLOCK"
  tcp_options {
    destination_port_range {
      max = 1522
      min = 1522
    }
  }
}

resource "oci_core_network_security_group_security_rule" "FoggyKitchenATPSecurityIngressGroup2Rule3" {
  provider                  = oci.region2
  network_security_group_id = oci_core_network_security_group.FoggyKitchenATPSecurityGroup2.id
  direction                 = "INGRESS"
  protocol                  = "6"
  source                    = var.Web-VCN3-CIDR
  source_type               = "CIDR_BLOCK"
  tcp_options {
    destination_port_range {
      max = 1522
      min = 1522
    }
  }
}

# FoggyKitchenATPSecurityGroup1 (region3)

resource "oci_core_network_security_group" "FoggyKitchenATPSecurityGroup3" {
  provider       = oci.region3
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  display_name   = "ATPSecurityGroup3"
  vcn_id         = oci_core_virtual_network.FoggyKitchenATPVCN3.id
}

# Rules related to ATPSecurityGroup (region3)

# EGRESS

resource "oci_core_network_security_group_security_rule" "FoggyKitchenATPSecurityEgressGroup3Rule1" {
  provider                  = oci.region3
  network_security_group_id = oci_core_network_security_group.FoggyKitchenATPSecurityGroup3.id
  direction                 = "EGRESS"
  protocol                  = "6"
  destination               = var.Web-VCN1-CIDR
  destination_type          = "CIDR_BLOCK"
}

resource "oci_core_network_security_group_security_rule" "FoggyKitchenATPSecurityEgressGroup3Rule2" {
  provider                  = oci.region3
  network_security_group_id = oci_core_network_security_group.FoggyKitchenATPSecurityGroup3.id
  direction                 = "EGRESS"
  protocol                  = "6"
  destination               = var.Web-VCN2-CIDR
  destination_type          = "CIDR_BLOCK"
}

resource "oci_core_network_security_group_security_rule" "FoggyKitchenATPSecurityEgressGroup3Rule3" {
  provider                  = oci.region3
  network_security_group_id = oci_core_network_security_group.FoggyKitchenATPSecurityGroup3.id
  direction                 = "EGRESS"
  protocol                  = "6"
  destination               = var.Web-VCN3-CIDR
  destination_type          = "CIDR_BLOCK"
}

# INGRESS

resource "oci_core_network_security_group_security_rule" "FoggyKitchenATPSecurityIngressGroup3Rule1" {
  provider                  = oci.region3
  network_security_group_id = oci_core_network_security_group.FoggyKitchenATPSecurityGroup3.id
  direction                 = "INGRESS"
  protocol                  = "6"
  source                    = var.Web-VCN1-CIDR
  source_type               = "CIDR_BLOCK"
  tcp_options {
    destination_port_range {
      max = 1522
      min = 1522
    }
  }
}

resource "oci_core_network_security_group_security_rule" "FoggyKitchenATPSecurityIngressGroup3Rule2" {
  provider                  = oci.region3
  network_security_group_id = oci_core_network_security_group.FoggyKitchenATPSecurityGroup3.id
  direction                 = "INGRESS"
  protocol                  = "6"
  source                    = var.Web-VCN2-CIDR
  source_type               = "CIDR_BLOCK"
  tcp_options {
    destination_port_range {
      max = 1522
      min = 1522
    }
  }
}

resource "oci_core_network_security_group_security_rule" "FoggyKitchenATPSecurityIngressGroup3Rule3" {
  provider                  = oci.region3
  network_security_group_id = oci_core_network_security_group.FoggyKitchenATPSecurityGroup3.id
  direction                 = "INGRESS"
  protocol                  = "6"
  source                    = var.Web-VCN3-CIDR
  source_type               = "CIDR_BLOCK"
  tcp_options {
    destination_port_range {
      max = 1522
      min = 1522
    }
  }
}


# FoggyKitchenWebSecurityGroup1 (region1)

resource "oci_core_network_security_group" "FoggyKitchenWebSecurityGroup1" {
  provider       = oci.region1
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  vcn_id         = oci_core_virtual_network.FoggyKitchenWebVCN1.id
  display_name   = "Web1NSG"
}

resource "oci_core_network_security_group_security_rule" "FoggyKitchenWebSecurityEgressGroup1Rule2" {
  provider                  = oci.region1
  network_security_group_id = oci_core_network_security_group.FoggyKitchenWebSecurityGroup1.id
  direction                 = "EGRESS"
  protocol                  = "6"
  destination               = "0.0.0.0/0"
  destination_type          = "CIDR_BLOCK"
}

# INGRESS Rules - FoggyKitchenWebSecurityGroup1 

resource "oci_core_network_security_group_security_rule" "FoggyKitchenWebSecurityIngressGroup1Rule3" {
  provider                  = oci.region1
  network_security_group_id = oci_core_network_security_group.FoggyKitchenWebSecurityGroup1.id
  direction                 = "INGRESS"
  protocol                  = "6"
  source                    = "0.0.0.0/0"
  source_type               = "CIDR_BLOCK"
  tcp_options {
    destination_port_range {
      max = 80
      min = 80
    }
  }
}

# FoggyKitchenWebSecurityGroup2 (region2)

resource "oci_core_network_security_group" "FoggyKitchenWebSecurityGroup2" {
  provider       = oci.region2
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  vcn_id         = oci_core_virtual_network.FoggyKitchenWebVCN2.id
  display_name   = "Web2NSG"
}


resource "oci_core_network_security_group_security_rule" "FoggyKitchenWebSecurityEgressGroup2Rule2" {
  provider                  = oci.region2
  network_security_group_id = oci_core_network_security_group.FoggyKitchenWebSecurityGroup2.id
  direction                 = "EGRESS"
  protocol                  = "6"
  destination               = "0.0.0.0/0"
  destination_type          = "CIDR_BLOCK"
}

# INGRESS Rules - FoggyKitchenWebSecurityGroup2 

resource "oci_core_network_security_group_security_rule" "FoggyKitchenWebSecurityIngressGroup2Rule3" {
  provider                  = oci.region2
  network_security_group_id = oci_core_network_security_group.FoggyKitchenWebSecurityGroup2.id
  direction                 = "INGRESS"
  protocol                  = "6"
  source                    = "0.0.0.0/0"
  source_type               = "CIDR_BLOCK"
  tcp_options {
    destination_port_range {
      max = 80
      min = 80
    }
  }
}

# FoggyKitchenWebSecurityGroup3 (region3)

resource "oci_core_network_security_group" "FoggyKitchenWebSecurityGroup3" {
  provider       = oci.region3
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  vcn_id         = oci_core_virtual_network.FoggyKitchenWebVCN3.id
  display_name   = "Web3NSG"
}

resource "oci_core_network_security_group_security_rule" "FoggyKitchenWebSecurityEgressGroup3Rule2" {
  provider                  = oci.region3
  network_security_group_id = oci_core_network_security_group.FoggyKitchenWebSecurityGroup3.id
  direction                 = "EGRESS"
  protocol                  = "6"
  destination               = "0.0.0.0/0"
  destination_type          = "CIDR_BLOCK"
}

# INGRESS Rules - FoggyKitchenWebSecurityGroup3 

resource "oci_core_network_security_group_security_rule" "FoggyKitchenWebSecurityIngressGroup3Rule3" {
  provider                  = oci.region3
  network_security_group_id = oci_core_network_security_group.FoggyKitchenWebSecurityGroup3.id
  direction                 = "INGRESS"
  protocol                  = "6"
  source                    = "0.0.0.0/0"
  source_type               = "CIDR_BLOCK"
  tcp_options {
    destination_port_range {
      max = 80
      min = 80
    }
  }
}
