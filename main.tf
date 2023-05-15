resource "ibm_resource_group" "ws_group" {
  name = "watson-studio-rg"
}

resource "ibm_resource_instance" "cos_instance" {
  name              = "cos-instance"
  resource_group_id = ibm_resource_group.ws_group.id
  service           = "cloud-object-storage"
  plan              = "standard"
  location          = "global"
}

resource ibm_resource_instance studio_instance {
  name              = "watson-studio1"
  service           = "data-science-experience"
  plan              = "professional-v1"
  location          = "eu-de"
  resource_group_id = ibm_resource_group.ws_group.id
  tags              = []

  timeouts {
    create = "15m"
    update = "15m"
    delete = "15m"
  }
}