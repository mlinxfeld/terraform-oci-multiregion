
resource "oci_health_checks_http_monitor" "FoggyKitchenWebServersHttpMonitor" {
    count               = var.enable_dns ? 1 : 0 
    provider            = oci.homeregion
    compartment_id      = oci_identity_compartment.FoggyKitchenCompartment.id
    display_name        = "FoggyKitchenWebServersHttpMonitor"
    interval_in_seconds = 30
    protocol            = "HTTP"
    targets             = [oci_core_instance.FoggyKitchenWebserver1.public_ip,
    oci_core_instance.FoggyKitchenWebserver2.public_ip,
    oci_core_instance.FoggyKitchenWebserver3.public_ip]
}

resource "oci_core_public_ip" "FoggyKitchenARecordPublicIP" {
  count          = var.enable_dns ? 1 : 0 
  provider       = oci.homeregion
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  display_name   = "FoggyKitchenARecordPublicIP"
  lifetime       = "RESERVED"
  lifecycle {
    ignore_changes = [defined_tags]
  }
}

resource "oci_dns_zone" "FoggyKitchenDNSZone" {
    count          = var.enable_dns ? 1 : 0 
    provider       = oci.homeregion
    compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
    name           = var.dns_domain
    zone_type      = "PRIMARY"
}

resource "oci_dns_record" "FoggyKitchenDNSPublicServerRecordA" {
    count           = var.enable_dns ? 1 : 0 
    provider        = oci.homeregion
    zone_name_or_id = oci_dns_zone.FoggyKitchenDNSZone[0].id
    domain          = var.dns_domain
    rtype           = "A"
    compartment_id  = oci_identity_compartment.FoggyKitchenCompartment.id
    rdata           = oci_core_public_ip.FoggyKitchenARecordPublicIP[0].ip_address
    ttl             = var.dns_a_record_ttl
}

resource "oci_dns_steering_policy" "FoggyKitchenDNSSteeringPolicy" {
    count           = var.enable_dns ? 1 : 0 
    provider        = oci.homeregion
    compartment_id  = oci_identity_compartment.FoggyKitchenCompartment.id
    display_name    = "FoggyKitchenDNSSteeringPolicy"
    template        = "LOAD_BALANCE"

    answers {
        name = "FoggyKitchenWebserver1_PublicIP_in_region_${var.region1}"
        rtype = "A"
        rdata = oci_core_instance.FoggyKitchenWebserver1.public_ip
    }

    answers {
        name = "FoggyKitchenWebserver2_PublicIP_in_region_${var.region2}"
        rtype = "A"
        rdata = oci_core_instance.FoggyKitchenWebserver2.public_ip
    }

    answers {
        name = "FoggyKitchenWebserver3_PublicIP_in_region_${var.region3}"
        rtype = "A"
        rdata = oci_core_instance.FoggyKitchenWebserver3.public_ip
    }

    health_check_monitor_id = oci_health_checks_http_monitor.FoggyKitchenWebServersHttpMonitor[0].id
    
   
    rules {
        rule_type = "FILTER"
    
        default_answer_data  {
            answer_condition = "answer.isDisabled != true"
            should_keep = true
        }
    }


    rules {
        rule_type = "HEALTH"
    }

    rules {
        rule_type = "WEIGHTED"

        default_answer_data  {            
            answer_condition = "answer.name == '${oci_core_instance.FoggyKitchenWebserver1.public_ip}'"
            value = 33
        } 

        default_answer_data  {  
            answer_condition = "answer.name == '${oci_core_instance.FoggyKitchenWebserver2.public_ip}'"
            value = 33
        }

        default_answer_data  { 
            answer_condition = "answer.name == '${oci_core_instance.FoggyKitchenWebserver3.public_ip}'"
            value = 33
        }
    }


    rules {
        rule_type = "LIMIT"
        default_count = 1
    }

    ttl = var.steering_policy_ttl
}

resource "oci_dns_steering_policy_attachment" "oggyKitchenDNSSteeringPolicyAttachment" {
    count              = var.enable_dns ? 1 : 0 
    provider           = oci.homeregion
    domain_name        = var.dns_domain
    display_name       = "FoggyKitchenDNSSteeringPolicyAttachment"
    steering_policy_id = oci_dns_steering_policy.FoggyKitchenDNSSteeringPolicy[0].id
    zone_id            = oci_dns_zone.FoggyKitchenDNSZone[0].id
}
