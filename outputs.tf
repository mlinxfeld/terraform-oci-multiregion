# Webserver1_PublicIP
output "FoggyKitchenWebserver1_PublicIP" {
  value = [oci_core_instance.FoggyKitchenWebserver1.public_ip]
}

# Webserver1_PrivateIP
output "FoggyKitchenWebserver1_PrivateIP" {
  value = [oci_core_instance.FoggyKitchenWebserver1.private_ip]
}

# Webserver2_PublicIP
output "FoggyKitchenWebserver2_PublicIP" {
  value = [oci_core_instance.FoggyKitchenWebserver2.public_ip]
}

# Webserver2_PrivateIP
output "FoggyKitchenWebserver2_PrivateIP" {
  value = [oci_core_instance.FoggyKitchenWebserver2.private_ip]
}

# Webserver3_PublicIP
output "FoggyKitchenWebserver3_PublicIP" {
  value = [oci_core_instance.FoggyKitchenWebserver3.public_ip]
}

# Webserver3_PrivateIP
output "FoggyKitchenWebserver3_PrivateIP" {
  value = [oci_core_instance.FoggyKitchenWebserver3.private_ip]
}

# ATP1_Private_Endpoint_IP
output "FoggyKitchenATP1_Private_Endpoint_IP" {
  value = [oci_database_autonomous_database.atp1.private_endpoint_ip]
}

# ATP2_Private_Endpoint_IP
output "FoggyKitchenATP2_Private_Endpoint_IP" {
  value = [oci_database_autonomous_database.atp2.private_endpoint_ip]
}

# ATP3_Private_Endpoint_IP
output "FoggyKitchenATP3_Private_Endpoint_IP" {
  value = [oci_database_autonomous_database.atp3.private_endpoint_ip]
}

# Generated Private Key for WebServer Instances
output "generated_ssh_private_key" {
  value     = tls_private_key.public_private_key_pair.private_key_pem
  sensitive = true
}

