# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# bastionsession.tf
#
# Purpose: The following file contains the logic to provision a bastion session attached to a given bastion service
# Registry: https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/bastion_session


resource "oci_bastion_session" "bastion_session" {
  count      = length(var.bastion_session_compute_list)
  bastion_id = var.bastion_service_id

  key_details {
    public_key_content = file(var.ssh_public_key)
  }

  dynamic "target_resource_details" {
    for_each = var.bastion_session_compute_list[count.index]["type"] == "MANAGED_SSH" ? [1] : []
    content {
      session_type       = "MANAGED_SSH"
      target_resource_id = var.bastion_session_compute_list[count.index]["id"]

      target_resource_operating_system_user_name = var.bastion_session_compute_list[count.index]["username"]
    }
  }

  dynamic "target_resource_details" {
    for_each = var.bastion_session_compute_list[count.index]["type"] == "PORT_FORWARDING" ? [1] : []
    content {
      session_type       = "PORT_FORWARDING"
      target_resource_id = var.bastion_session_compute_list[count.index]["id"]

      target_resource_port = var.bastion_session_compute_list[count.index]["port"]
    }
  }

  display_name           = var.bastion_session_compute_list[count.index]["displayname"]
  session_ttl_in_seconds = var.bastion_session_compute_list[count.index]["ttl"]
}
