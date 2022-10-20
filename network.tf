# ATPVCN1 (Region1)
resource "oci_core_virtual_network" "FoggyKitchenATPVCN1" {
  provider       = oci.region1
  cidr_block     = var.ATP-VCN1-CIDR
  dns_label      = "ATPVCN1"
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  display_name   = "FoggyKitchenATPVCN1"
}

# WebVCN1 (Region1)
resource "oci_core_virtual_network" "FoggyKitchenWebVCN1" {
  provider       = oci.region1
  cidr_block     = var.Web-VCN1-CIDR
  dns_label      = "WebVCN1"
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  display_name   = "FoggyKitchenWebVCN1"
}


# ATPVCN2 (Region2)
resource "oci_core_virtual_network" "FoggyKitchenATPVCN2" {
  provider       = oci.region2
  cidr_block     = var.ATP-VCN2-CIDR
  dns_label      = "ATPVCN2"
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  display_name   = "FoggyKitchenATPVCN2"
}

# WebVCN2 (Region2)
resource "oci_core_virtual_network" "FoggyKitchenWebVCN2" {
  provider       = oci.region2
  cidr_block     = var.Web-VCN2-CIDR
  dns_label      = "WebVCN2"
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  display_name   = "FoggyKitchenWebVCN2"
}

# ATPVCN3 (Region3)
resource "oci_core_virtual_network" "FoggyKitchenATPVCN3" {
  provider       = oci.region3
  cidr_block     = var.ATP-VCN3-CIDR
  dns_label      = "ATPVCN3"
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  display_name   = "FoggyKitchenATPVCN3"
}

# WebVCN3 (Region3)
resource "oci_core_virtual_network" "FoggyKitchenWebVCN3" {
  provider       = oci.region3
  cidr_block     = var.Web-VCN3-CIDR
  dns_label      = "WebVCN3"
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  display_name   = "FoggyKitchenWebVCN3"
}


# DHCP Options for ATP-VCN1 (Region1)
resource "oci_core_dhcp_options" "FoggyKitchenDhcpOptionsATPVCN1" {
  provider       = oci.region1
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  vcn_id         = oci_core_virtual_network.FoggyKitchenATPVCN1.id
  display_name   = "FoggyKitchenDhcpOptionsATPVCN1"

  // required
  options {
    type        = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
  }
}

# DHCP Options for Web-VCN1 (Region1)
resource "oci_core_dhcp_options" "FoggyKitchenDhcpOptionsWebVCN1" {
  provider       = oci.region1
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  vcn_id         = oci_core_virtual_network.FoggyKitchenWebVCN1.id
  display_name   = "FoggyKitchenDhcpOptionsWebVCN1"

  // required
  options {
    type        = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
  }
}

# DHCP Options for ATP-VCN2 (Region2)
resource "oci_core_dhcp_options" "FoggyKitchenDhcpOptionsATPVCN2" {
  provider       = oci.region2
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  vcn_id         = oci_core_virtual_network.FoggyKitchenATPVCN2.id
  display_name   = "FoggyKitchenDhcpOptionsATPVCN2"

  // required
  options {
    type        = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
  }
}

# DHCP Options for Web-VCN2 (Region2)
resource "oci_core_dhcp_options" "FoggyKitchenDhcpOptionsWebVCN2" {
  provider       = oci.region2
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  vcn_id         = oci_core_virtual_network.FoggyKitchenWebVCN2.id
  display_name   = "FoggyKitchenDhcpOptionsWebVCN2"

  // required
  options {
    type        = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
  }
}

# DHCP Options for ATP-VCN3 (Region3)
resource "oci_core_dhcp_options" "FoggyKitchenDhcpOptionsATPVCN3" {
  provider       = oci.region3
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  vcn_id         = oci_core_virtual_network.FoggyKitchenATPVCN3.id
  display_name   = "FoggyKitchenDhcpOptionsATPVCN3"

  // required
  options {
    type        = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
  }
}

# DHCP Options for Web-VCN3 (Region3)
resource "oci_core_dhcp_options" "FoggyKitchenDhcpOptionsWebVCN3" {
  provider       = oci.region3
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  vcn_id         = oci_core_virtual_network.FoggyKitchenWebVCN3.id
  display_name   = "FoggyKitchenDhcpOptionsWebVCN3"

  // required
  options {
    type        = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
  }
}


# Internet Gateway (Region1)
resource "oci_core_internet_gateway" "FoggyKitchenInternetGateway1" {
  provider       = oci.region1
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  display_name   = "FoggyKitchenInternetGateway1"
  vcn_id         = oci_core_virtual_network.FoggyKitchenWebVCN1.id
}

# Route Table for IGW (Region1)
resource "oci_core_route_table" "FoggyKitchenRouteTableViaIGW1" {
  provider       = oci.region1
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  vcn_id         = oci_core_virtual_network.FoggyKitchenWebVCN1.id
  display_name   = "FoggyKitchenRouteTableViaIGW1"
  
  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.FoggyKitchenInternetGateway1.id
  }

  route_rules {
    destination       = var.ATP-VCN1-CIDR
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_drg.FoggyKitchenDRG1.id
  }

  route_rules {
    destination       = var.ATP-VCN2-CIDR
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_drg.FoggyKitchenDRG1.id
  }

  route_rules {
    destination       = var.ATP-VCN3-CIDR
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_drg.FoggyKitchenDRG1.id
  }

  route_rules {
    destination       = var.Web-VCN2-CIDR
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_drg.FoggyKitchenDRG1.id
  }

  route_rules {
    destination       = var.Web-VCN3-CIDR
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_drg.FoggyKitchenDRG1.id
  }

}

# Internet Gateway (Region2)
resource "oci_core_internet_gateway" "FoggyKitchenInternetGateway2" {
  provider       = oci.region2
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  display_name   = "FoggyKitchenInternetGateway2"
  vcn_id         = oci_core_virtual_network.FoggyKitchenWebVCN2.id
}

# Route Table for IGW (Region2)
resource "oci_core_route_table" "FoggyKitchenRouteTableViaIGW2" {
  provider       = oci.region2
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  vcn_id         = oci_core_virtual_network.FoggyKitchenWebVCN2.id
  display_name   = "FoggyKitchenRouteTableViaIGW2"
  
  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.FoggyKitchenInternetGateway2.id
  }

  route_rules {
    destination       = var.ATP-VCN1-CIDR
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_drg.FoggyKitchenDRG2.id
  }

  route_rules {
    destination       = var.ATP-VCN2-CIDR
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_drg.FoggyKitchenDRG2.id
  }

  route_rules {
    destination       = var.ATP-VCN3-CIDR
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_drg.FoggyKitchenDRG2.id
  }

  route_rules {
    destination       = var.Web-VCN1-CIDR
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_drg.FoggyKitchenDRG2.id
  }

  route_rules {
    destination       = var.Web-VCN3-CIDR
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_drg.FoggyKitchenDRG2.id
  }

}

# Internet Gateway (Region3)
resource "oci_core_internet_gateway" "FoggyKitchenInternetGateway3" {
  provider       = oci.region3
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  display_name   = "FoggyKitchenInternetGateway3"
  vcn_id         = oci_core_virtual_network.FoggyKitchenWebVCN3.id
}

# Route Table for IGW (Region3)
resource "oci_core_route_table" "FoggyKitchenRouteTableViaIGW3" {
  provider       = oci.region3
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  vcn_id         = oci_core_virtual_network.FoggyKitchenWebVCN3.id
  display_name   = "FoggyKitchenRouteTableViaIGW3"
  
  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.FoggyKitchenInternetGateway3.id
  }

  route_rules {
    destination       = var.ATP-VCN1-CIDR
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_drg.FoggyKitchenDRG3.id
  }

  route_rules {
    destination       = var.ATP-VCN2-CIDR
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_drg.FoggyKitchenDRG3.id
  }

  route_rules {
    destination       = var.ATP-VCN3-CIDR
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_drg.FoggyKitchenDRG3.id
  }

  route_rules {
    destination       = var.Web-VCN1-CIDR
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_drg.FoggyKitchenDRG3.id
  }

  route_rules {
    destination       = var.Web-VCN2-CIDR
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_drg.FoggyKitchenDRG3.id
  }
}

# NAT Gateway Region 1 (Region1)
resource "oci_core_nat_gateway" "FoggyKitchenNATGateway1" {
  provider       = oci.region1
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  display_name   = "FoggyKitchenNATGateway1"
  vcn_id         = oci_core_virtual_network.FoggyKitchenATPVCN1.id
}

# Route Table for NAT and DRG (Region1)
resource "oci_core_route_table" "FoggyKitchenRouteTableViaNATandDRG1" {
  provider       = oci.region1
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  vcn_id         = oci_core_virtual_network.FoggyKitchenATPVCN1.id
  display_name   = "FoggyKitchenRouteTableViaNATandDRG1"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_nat_gateway.FoggyKitchenNATGateway1.id
  }

  route_rules {
    destination       = var.Web-VCN1-CIDR
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_drg.FoggyKitchenDRG1.id
  }

  route_rules {
    destination       = var.Web-VCN2-CIDR
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_drg.FoggyKitchenDRG1.id
  }

  route_rules {
    destination       = var.Web-VCN3-CIDR
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_drg.FoggyKitchenDRG1.id
  }

  route_rules {
    destination       = var.ATP-VCN2-CIDR
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_drg.FoggyKitchenDRG1.id
  }

  route_rules {
    destination       = var.ATP-VCN3-CIDR
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_drg.FoggyKitchenDRG1.id
  }
}

# NAT Gateway (Region2)
resource "oci_core_nat_gateway" "FoggyKitchenNATGateway2" {
  provider       = oci.region2
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  display_name   = "FoggyKitchenNATGateway2"
  vcn_id         = oci_core_virtual_network.FoggyKitchenATPVCN2.id
}

# Route Table for NAT and DRG (Region2)
resource "oci_core_route_table" "FoggyKitchenRouteTableViaNATandDRG2" {
  provider       = oci.region2
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  vcn_id         = oci_core_virtual_network.FoggyKitchenATPVCN2.id
  display_name   = "FoggyKitchenRouteTableViaNATandDRG2"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_nat_gateway.FoggyKitchenNATGateway2.id
  }

  route_rules {
    destination       = var.Web-VCN1-CIDR
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_drg.FoggyKitchenDRG2.id
  }

  route_rules {
    destination       = var.Web-VCN2-CIDR
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_drg.FoggyKitchenDRG2.id
  }

  route_rules {
    destination       = var.Web-VCN3-CIDR
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_drg.FoggyKitchenDRG2.id
  }

  route_rules {
    destination       = var.ATP-VCN1-CIDR
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_drg.FoggyKitchenDRG2.id
  }

  route_rules {
    destination       = var.ATP-VCN3-CIDR
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_drg.FoggyKitchenDRG2.id
  }
}

# NAT Gateway Region 3 (Region3)
resource "oci_core_nat_gateway" "FoggyKitchenNATGateway3" {
  provider       = oci.region3
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  display_name   = "FoggyKitchenNATGateway3"
  vcn_id         = oci_core_virtual_network.FoggyKitchenATPVCN3.id
}

# Route Table for NAT and DRG (Region3)
resource "oci_core_route_table" "FoggyKitchenRouteTableViaNATandDRG3" {
  provider       = oci.region3
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  vcn_id         = oci_core_virtual_network.FoggyKitchenATPVCN3.id
  display_name   = "FoggyKitchenRouteTableViaNATandDRG3"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_nat_gateway.FoggyKitchenNATGateway3.id
  }

  route_rules {
    destination       = var.Web-VCN1-CIDR
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_drg.FoggyKitchenDRG3.id
  }

  route_rules {
    destination       = var.Web-VCN2-CIDR
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_drg.FoggyKitchenDRG3.id
  }

  route_rules {
    destination       = var.Web-VCN3-CIDR
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_drg.FoggyKitchenDRG3.id
  }

  route_rules {
    destination       = var.ATP-VCN1-CIDR
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_drg.FoggyKitchenDRG3.id
  }

  route_rules {
    destination       = var.ATP-VCN2-CIDR
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_drg.FoggyKitchenDRG3.id
  }

}


# Security List for HTTP/HTTPS (Region1)
resource "oci_core_security_list" "FoggyKitchenWebSecurityList1" {
  provider       = oci.region1
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  display_name   = "FoggyKitchenWebSecurityList1"
  vcn_id         = oci_core_virtual_network.FoggyKitchenWebVCN1.id

  egress_security_rules {
    protocol    = "6"
    destination = "0.0.0.0/0"
  }

  dynamic "ingress_security_rules" {
    for_each = var.webservice_ports
    content {
      protocol = "6"
      source   = "0.0.0.0/0"
      tcp_options {
        max = ingress_security_rules.value
        min = ingress_security_rules.value
      }
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = var.Web-VCN1-CIDR
  }
}

# Security List for HTTP/HTTPS (Region2)
resource "oci_core_security_list" "FoggyKitchenWebSecurityList2" {
  provider       = oci.region2
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  display_name   = "FoggyKitchenWebSecurityList2"
  vcn_id         = oci_core_virtual_network.FoggyKitchenWebVCN2.id

  egress_security_rules {
    protocol    = "6"
    destination = "0.0.0.0/0"
  }

  dynamic "ingress_security_rules" {
    for_each = var.webservice_ports
    content {
      protocol = "6"
      source   = "0.0.0.0/0"
      tcp_options {
        max = ingress_security_rules.value
        min = ingress_security_rules.value
      }
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = var.Web-VCN2-CIDR
  }
}

# Security List for HTTP/HTTPS (Region3)
resource "oci_core_security_list" "FoggyKitchenWebSecurityList3" {
  provider       = oci.region3
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  display_name   = "FoggyKitchenWebSecurityList3"
  vcn_id         = oci_core_virtual_network.FoggyKitchenWebVCN3.id

  egress_security_rules {
    protocol    = "6"
    destination = "0.0.0.0/0"
  }

  dynamic "ingress_security_rules" {
    for_each = var.webservice_ports
    content {
      protocol = "6"
      source   = "0.0.0.0/0"
      tcp_options {
        max = ingress_security_rules.value
        min = ingress_security_rules.value
      }
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = var.Web-VCN3-CIDR
  }
}

# Security List for ICMP in VCN (Region1)
resource "oci_core_security_list" "FoggyKitchenICMPecurityList1" {
  provider       = oci.region1
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  display_name   = "FoggyKitchenICMPSecurityList1"
  vcn_id         = oci_core_virtual_network.FoggyKitchenWebVCN1.id

  egress_security_rules {
    protocol    = "All"
    destination = "0.0.0.0/0"
  }

  ingress_security_rules {
    protocol  = 1
    source    = "0.0.0.0/0"
    stateless = true
    icmp_options {
      type = 3
      code = 4
    }
  }
}

# Security List for ICMP in VCN (Region2)
resource "oci_core_security_list" "FoggyKitchenICMPecurityList2" {
  provider       = oci.region2
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  display_name   = "FoggyKitchenICMPSecurityList2"
  vcn_id         = oci_core_virtual_network.FoggyKitchenWebVCN2.id

  egress_security_rules {
    protocol    = "All"
    destination = "0.0.0.0/0"
  }

  ingress_security_rules {
    protocol  = 1
    source    = "0.0.0.0/0"
    stateless = true
    icmp_options {
      type = 3
      code = 4
    }
  }
}

# Security List for ICMP in VCN (Region3)
resource "oci_core_security_list" "FoggyKitchenICMPecurityList3" {
  provider       = oci.region3
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  display_name   = "FoggyKitchenICMPSecurityList3"
  vcn_id         = oci_core_virtual_network.FoggyKitchenWebVCN3.id

  egress_security_rules {
    protocol    = "All"
    destination = "0.0.0.0/0"
  }

  ingress_security_rules {
    protocol  = 1
    source    = "0.0.0.0/0"
    stateless = true
    icmp_options {
      type = 3
      code = 4
    }
  }
}


# Security List for SSH in VCN (Region1)
resource "oci_core_security_list" "FoggyKitchenSSHSecurityList1" {
  provider       = oci.region1
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  display_name   = "FoggyKitchenSSHSecurityList1"
  vcn_id         = oci_core_virtual_network.FoggyKitchenWebVCN1.id

  egress_security_rules {
    protocol    = "6"
    destination = "0.0.0.0/0"
  }

  dynamic "ingress_security_rules" {
    for_each = var.bastion_ports
    content {
      protocol = "6"
      source   = "0.0.0.0/0"
      tcp_options {
        max = ingress_security_rules.value
        min = ingress_security_rules.value
      }
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = var.Web-VCN1-CIDR
  }
}

# Security List for SSH in VCN (Region2)
resource "oci_core_security_list" "FoggyKitchenSSHSecurityList2" {
  provider       = oci.region2
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  display_name   = "FoggyKitchenSSHSecurityList2"
  vcn_id         = oci_core_virtual_network.FoggyKitchenWebVCN2.id

  egress_security_rules {
    protocol    = "6"
    destination = "0.0.0.0/0"
  }

  dynamic "ingress_security_rules" {
    for_each = var.bastion_ports
    content {
      protocol = "6"
      source   = "0.0.0.0/0"
      tcp_options {
        max = ingress_security_rules.value
        min = ingress_security_rules.value
      }
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = var.Web-VCN2-CIDR
  }
}

# Security List for SSH in VCN (Region3)
resource "oci_core_security_list" "FoggyKitchenSSHSecurityList3" {
  provider       = oci.region3
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  display_name   = "FoggyKitchenSSHSecurityList3"
  vcn_id         = oci_core_virtual_network.FoggyKitchenWebVCN3.id

  egress_security_rules {
    protocol    = "6"
    destination = "0.0.0.0/0"
  }

  dynamic "ingress_security_rules" {
    for_each = var.bastion_ports
    content {
      protocol = "6"
      source   = "0.0.0.0/0"
      tcp_options {
        max = ingress_security_rules.value
        min = ingress_security_rules.value
      }
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = var.Web-VCN3-CIDR
  }
}

# WebSubnet1 (public) in WebVCN1 (Region1)
resource "oci_core_subnet" "FoggyKitchenWebSubnet1" {
  provider          = oci.region1
  cidr_block        = var.Web-Subnet1-CIDR
  display_name      = "FoggyKitchenWebSubnet1"
  dns_label         = "websub1"
  compartment_id    = oci_identity_compartment.FoggyKitchenCompartment.id
  vcn_id            = oci_core_virtual_network.FoggyKitchenWebVCN1.id
  route_table_id    = oci_core_route_table.FoggyKitchenRouteTableViaIGW1.id
  dhcp_options_id   = oci_core_dhcp_options.FoggyKitchenDhcpOptionsWebVCN1.id
  security_list_ids = [oci_core_security_list.FoggyKitchenSSHSecurityList1.id, oci_core_security_list.FoggyKitchenICMPecurityList1.id]
}

# ATPSubnet1 (private) in ATPVCN1 (Region1)
resource "oci_core_subnet" "FoggyKitchenATPSubnet1" {
  provider                   = oci.region1
  cidr_block                 = var.ATP-Subnet1-CIDR
  display_name               = "FoggyKitchenATPSubnet1"
  dns_label                  = "atpsub1"
  prohibit_public_ip_on_vnic = true
  compartment_id             = oci_identity_compartment.FoggyKitchenCompartment.id
  vcn_id                     = oci_core_virtual_network.FoggyKitchenATPVCN1.id
  route_table_id             = oci_core_route_table.FoggyKitchenRouteTableViaNATandDRG1.id
  dhcp_options_id            = oci_core_dhcp_options.FoggyKitchenDhcpOptionsATPVCN1.id
}

# WebSubnet2 (public) in WebVCN2 (Region2)
resource "oci_core_subnet" "FoggyKitchenWebSubnet2" {
  provider          = oci.region2
  cidr_block        = var.Web-Subnet2-CIDR
  display_name      = "FoggyKitchenWebSubnet2"
  dns_label         = "websub2"
  compartment_id    = oci_identity_compartment.FoggyKitchenCompartment.id
  vcn_id            = oci_core_virtual_network.FoggyKitchenWebVCN2.id
  route_table_id    = oci_core_route_table.FoggyKitchenRouteTableViaIGW2.id
  dhcp_options_id   = oci_core_dhcp_options.FoggyKitchenDhcpOptionsWebVCN2.id
  security_list_ids = [oci_core_security_list.FoggyKitchenSSHSecurityList2.id, oci_core_security_list.FoggyKitchenICMPecurityList2.id]
}

# ATPSubnet2 (private) in ATPVCN2 (Region2)
resource "oci_core_subnet" "FoggyKitchenATPSubnet2" {
  provider                   = oci.region2
  cidr_block                 = var.ATP-Subnet2-CIDR
  display_name               = "FoggyKitchenATPSubnet2"
  dns_label                  = "atpsub2"
  prohibit_public_ip_on_vnic = true
  compartment_id             = oci_identity_compartment.FoggyKitchenCompartment.id
  vcn_id                     = oci_core_virtual_network.FoggyKitchenATPVCN2.id
  route_table_id             = oci_core_route_table.FoggyKitchenRouteTableViaNATandDRG2.id
  dhcp_options_id            = oci_core_dhcp_options.FoggyKitchenDhcpOptionsATPVCN2.id
}

# WebSubnet3 (public) in WebVCN3 (Region3)
resource "oci_core_subnet" "FoggyKitchenWebSubnet3" {
  provider          = oci.region3
  cidr_block        = var.Web-Subnet3-CIDR
  display_name      = "FoggyKitchenWebSubnet3"
  dns_label         = "websub3"
  compartment_id    = oci_identity_compartment.FoggyKitchenCompartment.id
  vcn_id            = oci_core_virtual_network.FoggyKitchenWebVCN3.id
  route_table_id    = oci_core_route_table.FoggyKitchenRouteTableViaIGW3.id
  dhcp_options_id   = oci_core_dhcp_options.FoggyKitchenDhcpOptionsWebVCN3.id
  security_list_ids = [oci_core_security_list.FoggyKitchenSSHSecurityList3.id, oci_core_security_list.FoggyKitchenICMPecurityList3.id]
}

# ATPSubnet3 (private) in ATPVCN3 (Region3)
resource "oci_core_subnet" "FoggyKitchenATPSubnet3" {
  provider                   = oci.region3
  cidr_block                 = var.ATP-Subnet3-CIDR
  display_name               = "FoggyKitchenATPSubnet3"
  dns_label                  = "atpsub3"
  prohibit_public_ip_on_vnic = true
  compartment_id             = oci_identity_compartment.FoggyKitchenCompartment.id
  vcn_id                     = oci_core_virtual_network.FoggyKitchenATPVCN3.id
  route_table_id             = oci_core_route_table.FoggyKitchenRouteTableViaNATandDRG3.id
  dhcp_options_id            = oci_core_dhcp_options.FoggyKitchenDhcpOptionsATPVCN3.id
}
