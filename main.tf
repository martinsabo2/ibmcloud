resource "ibm_resource_group" "cos_group" {
  name = "cos-resource-group"
}

resource "ibm_resource_instance" "cos_instance" {
  name              = "cos-instance"
  resource_group_id = ibm_resource_group.cos_group.id
  service           = "cloud-object-storage"
  plan              = "standard"
  location          = "global"
}

module "resource_group" {
  source = "cloud-native-toolkit/resource-group/ibm"

  resource_group_name = ibm_resource_group.cos_group.name
  ibmcloud_api_key    = var.ibmcloud_api_key
}

module "watsonstudio" {
  source = "github.com/ibm-garage-cloud/terraform-service-watsonstudio"

  resource_group_name      = module.resource_group.name
  resource_location        = var.region
  name_prefix              = var.name_prefix
}
