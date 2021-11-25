# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# variables.tf 
#
# Purpose: The following file declares all variables used in this backend repository

/********** Provider Variables NOT OVERLOADABLE **********/
variable "region" {
  description = "Target region where artifacts are going to be created"
}

variable "tenancy_ocid" {
  description = "OCID of tenancy"
}

variable "user_ocid" {
  description = "User OCID in tenancy."
}

variable "fingerprint" {
  description = "API Key Fingerprint for user_ocid derived from public API Key imported in OCI User config"
}

variable "private_key_path" {
  description = "Private Key Absolute path location where terraform is executed"
}

/********** Provider Variables NOT OVERLOADABLE **********/

/********** Brick Variables **********/

variable "ssh_public_key" {
  description = "Defines SSH Public Key to be used for the Bastion Session"
}

variable "bastion_service_id" {
  description = "Defines the Bastion Service OCID to attach the session to"
}

variable "bastion_session_compute_list" {
  description = "A list of objects that contains the display name, id, type, ttl and either the username or port, depending on which session type is used."
}

/********** Brick Variables **********/
