# FoggyKitchenWebServer1 Configuration Management

data "template_file" "config_py_template1" {
  template = file("${path.module}/templates/config.template.py")
  vars = {
  }
}


data "template_file" "flask_ATP_py_template1" {
  template = file("${path.module}/templates/flask_ATP.template.py")

  vars = {
    ATP_password                        = var.ATP_password
    ATP_alias                           = join("", [var.ATP_database_db_name1, "_medium"])
    oracle_instant_client_version_short = var.oracle_instant_client_version_short
    region                              = var.region1
    ATP_private_ip                      = oci_database_autonomous_database.atp1.private_endpoint_ip
  }
}

data "template_file" "flask_ATP_service_template1" {
  template = file("${path.module}/templates/flask_ATP.template.service")
  vars = {
  }
}

/*
data "template_file" "flask_ATP_sh_template1" {
  template = file("${path.module}/templates/flask_ATP.template.sh")

  vars = {
    oracle_instant_client_version_short = var.oracle_instant_client_version_short
  }
}
*/

data "template_file" "flask_bootstrap_template1" {
  template = file("${path.module}/templates/flask_bootstrap.template.sh")

  vars = {
    ATP_tde_wallet_zip_file             = var.ATP_tde_wallet_zip_file1
    oracle_instant_client_version       = var.oracle_instant_client_version
    oracle_instant_client_version_short = var.oracle_instant_client_version_short
    region                              = var.region1
    ATP_private_ip                      = oci_database_autonomous_database.atp1.private_endpoint_ip
  }
}

data "template_file" "sqlnet_ora_template1" {
  template = file("${path.module}/templates/sqlnet.template.ora")

  vars = {
    oracle_instant_client_version_short = var.oracle_instant_client_version_short
  }
}

resource "null_resource" "FoggyKitchenWebserver1_ConfigMgmt" {
  depends_on = [oci_core_instance.FoggyKitchenWebserver1, oci_database_autonomous_database.atp1]

  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = oci_core_instance.FoggyKitchenWebserver1.public_ip
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
    }
    content     = data.template_file.sqlnet_ora_template1.rendered
    destination = "/tmp/sqlnet.ora"
  }

  provisioner "local-exec" {
    command = "echo '${oci_database_autonomous_database_wallet.atp1_wallet.content}' >> ${var.ATP_tde_wallet_zip_file1}_encoded"
  }

  provisioner "local-exec" {
    command = "base64 --decode ${var.ATP_tde_wallet_zip_file1}_encoded > ${var.ATP_tde_wallet_zip_file1}"
  }

  provisioner "local-exec" {
    command = "rm -rf ${var.ATP_tde_wallet_zip_file1}_encoded"
  }

  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = oci_core_instance.FoggyKitchenWebserver1.public_ip
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
    }
    source      = var.ATP_tde_wallet_zip_file1
    destination = "/tmp/${var.ATP_tde_wallet_zip_file1}"
  }

  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = oci_core_instance.FoggyKitchenWebserver1.public_ip
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
    }
    content     = data.template_file.config_py_template1.rendered
    destination = "/tmp/config.py"
  }

  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = oci_core_instance.FoggyKitchenWebserver1.public_ip
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
    }
    content     = data.template_file.flask_ATP_py_template1.rendered
    destination = "/tmp/flask_ATP.py"
  }

  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = oci_core_instance.FoggyKitchenWebserver1.public_ip
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
    }
    content     = data.template_file.flask_ATP_service_template1.rendered
    destination = "/tmp/flask_ATP.service"
  }  

/*
  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = oci_core_instance.FoggyKitchenWebserver1.public_ip
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
    }
    content     = data.template_file.flask_ATP_sh_template1.rendered
    destination = "/tmp/flask_ATP.sh"
  }
*/

  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = oci_core_instance.FoggyKitchenWebserver1.public_ip
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
    }
    content     = data.template_file.flask_bootstrap_template1.rendered
    destination = "/tmp/flask_bootstrap.sh"
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = oci_core_instance.FoggyKitchenWebserver1.public_ip
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
    }
    inline = [
    "chmod +x /tmp/flask_bootstrap.sh",
    "sudo /tmp/flask_bootstrap.sh"]
  }

}

# FoggyKitchenWebServer2 Configuration Management

data "template_file" "config_py_template2" {
  template = file("${path.module}/templates/config.template.py")
  vars = {
  }
}

data "template_file" "flask_ATP_py_template2" {
  template = file("${path.module}/templates/flask_ATP.template.py")

  vars = {
    ATP_password                        = var.ATP_password
    ATP_alias                           = join("", [var.ATP_database_db_name2, "_medium"])
    oracle_instant_client_version_short = var.oracle_instant_client_version_short
    region                              = var.region2
    ATP_private_ip                      = oci_database_autonomous_database.atp2.private_endpoint_ip
  }
}

data "template_file" "flask_ATP_service_template2" {
  template = file("${path.module}/templates/flask_ATP.template.service")
  vars = {
  }
}

/*
data "template_file" "flask_ATP_sh_template2" {
  template = file("${path.module}/templates/flask_ATP.template.sh")

  vars = {
    oracle_instant_client_version_short = var.oracle_instant_client_version_short
  }
}
*/

data "template_file" "flask_bootstrap_template2" {
  template = file("${path.module}/templates/flask_bootstrap.template.sh")

  vars = {
    ATP_tde_wallet_zip_file             = var.ATP_tde_wallet_zip_file2
    oracle_instant_client_version       = var.oracle_instant_client_version
    oracle_instant_client_version_short = var.oracle_instant_client_version_short
    region                              = var.region2
    ATP_private_ip                      = oci_database_autonomous_database.atp2.private_endpoint_ip
  }
}

data "template_file" "sqlnet_ora_template2" {
  template = file("${path.module}/templates/sqlnet.template.ora")

  vars = {
    oracle_instant_client_version_short = var.oracle_instant_client_version_short
  }
}

resource "null_resource" "FoggyKitchenWebserver2_ConfigMgmt" {
  depends_on = [oci_core_instance.FoggyKitchenWebserver2, oci_database_autonomous_database.atp2]

  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = oci_core_instance.FoggyKitchenWebserver2.public_ip
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
    }
    content     = data.template_file.sqlnet_ora_template2.rendered
    destination = "/tmp/sqlnet.ora"
  }

  provisioner "local-exec" {
    command = "echo '${oci_database_autonomous_database_wallet.atp2_wallet.content}' >> ${var.ATP_tde_wallet_zip_file2}_encoded"
  }

  provisioner "local-exec" {
    command = "base64 --decode ${var.ATP_tde_wallet_zip_file2}_encoded > ${var.ATP_tde_wallet_zip_file2}"
  }

  provisioner "local-exec" {
    command = "rm -rf ${var.ATP_tde_wallet_zip_file2}_encoded"
  }

  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = oci_core_instance.FoggyKitchenWebserver2.public_ip
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
    }
    source      = var.ATP_tde_wallet_zip_file2
    destination = "/tmp/${var.ATP_tde_wallet_zip_file2}"
  }

  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = oci_core_instance.FoggyKitchenWebserver2.public_ip
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
    }
    content     = data.template_file.config_py_template2.rendered
    destination = "/tmp/config.py"
  }

  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = oci_core_instance.FoggyKitchenWebserver2.public_ip
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
    }
    content     = data.template_file.flask_ATP_py_template2.rendered
    destination = "/tmp/flask_ATP.py"
  }

  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = oci_core_instance.FoggyKitchenWebserver2.public_ip
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
    }
    content     = data.template_file.flask_ATP_service_template2.rendered
    destination = "/tmp/flask_ATP.service"
  }  

/*
  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = oci_core_instance.FoggyKitchenWebserver2.public_ip
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
    }
    content     = data.template_file.flask_ATP_sh_template2.rendered
    destination = "/tmp/flask_ATP.sh"
  }
*/

  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = oci_core_instance.FoggyKitchenWebserver2.public_ip
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
    }
    content     = data.template_file.flask_bootstrap_template2.rendered
    destination = "/tmp/flask_bootstrap.sh"
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = oci_core_instance.FoggyKitchenWebserver2.public_ip
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
    }
    inline = [
    "chmod +x /tmp/flask_bootstrap.sh",
    "sudo /tmp/flask_bootstrap.sh"]
  }

}

# FoggyKitchenWebServer3 Configuration Management

data "template_file" "config_py_template3" {
  template = file("${path.module}/templates/config.template.py")
  vars = {
  }
}

data "template_file" "flask_ATP_py_template3" {
  template = file("${path.module}/templates/flask_ATP.template.py")

  vars = {
    ATP_password                        = var.ATP_password
    ATP_alias                           = join("", [var.ATP_database_db_name3, "_medium"])
    oracle_instant_client_version_short = var.oracle_instant_client_version_short
    region                              = var.region3
    ATP_private_ip                      = oci_database_autonomous_database.atp3.private_endpoint_ip
  }
}

/*
data "template_file" "flask_ATP_sh_template3" {
  template = file("${path.module}/templates/flask_ATP.template.sh")

  vars = {
    oracle_instant_client_version_short = var.oracle_instant_client_version_short
  }
}
*/

data "template_file" "flask_ATP_service_template3" {
  template = file("${path.module}/templates/flask_ATP.template.service")
  vars = {
  }
}

data "template_file" "flask_bootstrap_template3" {
  template = file("${path.module}/templates/flask_bootstrap.template.sh")

  vars = {
    ATP_tde_wallet_zip_file             = var.ATP_tde_wallet_zip_file3
    oracle_instant_client_version       = var.oracle_instant_client_version
    oracle_instant_client_version_short = var.oracle_instant_client_version_short
    region                              = var.region3
    ATP_private_ip                      = oci_database_autonomous_database.atp3.private_endpoint_ip
  }
}

data "template_file" "sqlnet_ora_template3" {
  template = file("${path.module}/templates/sqlnet.template.ora")

  vars = {
    oracle_instant_client_version_short = var.oracle_instant_client_version_short
  }
}

resource "null_resource" "FoggyKitchenWebserver3_ConfigMgmt" {
  depends_on = [oci_core_instance.FoggyKitchenWebserver3, oci_database_autonomous_database.atp3]

  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = oci_core_instance.FoggyKitchenWebserver3.public_ip
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
    }
    content     = data.template_file.sqlnet_ora_template3.rendered
    destination = "/tmp/sqlnet.ora"
  }

  provisioner "local-exec" {
    command = "echo '${oci_database_autonomous_database_wallet.atp3_wallet.content}' >> ${var.ATP_tde_wallet_zip_file3}_encoded"
  }

  provisioner "local-exec" {
    command = "base64 --decode ${var.ATP_tde_wallet_zip_file3}_encoded > ${var.ATP_tde_wallet_zip_file3}"
  }

  provisioner "local-exec" {
    command = "rm -rf ${var.ATP_tde_wallet_zip_file3}_encoded"
  }

  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = oci_core_instance.FoggyKitchenWebserver3.public_ip
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
    }
    source      = var.ATP_tde_wallet_zip_file3
    destination = "/tmp/${var.ATP_tde_wallet_zip_file3}"
  }

  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = oci_core_instance.FoggyKitchenWebserver3.public_ip
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
    }
    content     = data.template_file.config_py_template3.rendered
    destination = "/tmp/config.py"
  }

  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = oci_core_instance.FoggyKitchenWebserver3.public_ip
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
    }
    content     = data.template_file.flask_ATP_py_template3.rendered
    destination = "/tmp/flask_ATP.py"
  }

  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = oci_core_instance.FoggyKitchenWebserver3.public_ip
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
    }
    content     = data.template_file.flask_ATP_service_template3.rendered
    destination = "/tmp/flask_ATP.service"
  }  

  /*
  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = oci_core_instance.FoggyKitchenWebserver3.public_ip
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
    }
    content     = data.template_file.flask_ATP_sh_template3.rendered
    destination = "/tmp/flask_ATP.sh"
  }
  */

  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = oci_core_instance.FoggyKitchenWebserver3.public_ip
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
    }
    content     = data.template_file.flask_bootstrap_template3.rendered
    destination = "/tmp/flask_bootstrap.sh"
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = oci_core_instance.FoggyKitchenWebserver3.public_ip
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
    }
    inline = [
    "chmod +x /tmp/flask_bootstrap.sh",
    "sudo /tmp/flask_bootstrap.sh"]
  }

}