# ---------------------------------------------------------------------------------------------------------------------
# Terraform configuration
#
# IBM Terraform provider releases:
# https://github.com/IBM-Cloud/terraform-provider-ibm/releases
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
    }
  }
}
