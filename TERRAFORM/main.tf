provider "vsphere" {
  user = "administrator@vsphere.local"
  password = "Iamroot!01"
  vsphere_server = "rt410p99.gtr.tp"
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "DC VISITTHIDETH"
}

data "vsphere_resource_pool" "pool" {
  name          = "RES_POOL"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "datastore" {
  name          = "datastore1"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network_interface" {
  name          = "VM Network"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name             = "debian-preseed"
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "vm" {
  name             = "debian-tf1"
  num_cpus         = 2
  resource_pool_id = data.vsphere_resource_pool.pool.id
  memory           = 4096
  guest_id         = "debian10_64Guest"
  datastore_id     = data.vsphere_datastore.datastore.id
  wait_for_guest_net_timeout = 0
  network_interface {
    network_id = data.vsphere_network.network_interface.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }
  disk {
    label = "disk0"
    size  = 20
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = "rt410vws5"
        domain= "gtr.tp"
      }
      network_interface {
        ipv4_address = "10.4.110.245"
        ipv4_netmask = 24
      }
      ipv4_gateway = "10.4.110.254"
      dns_server_list = ["10.4.110.250"]
    }
  }
}
resource "vsphere_virtual_machine" "vm2" {
  name             = "debian-tf2"
  num_cpus         = 2
  resource_pool_id = data.vsphere_resource_pool.pool.id
  memory           = 4096
  guest_id         = "debian10_64Guest"
  datastore_id     = data.vsphere_datastore.datastore.id
  wait_for_guest_net_timeout = 0
  network_interface {
    network_id = data.vsphere_network.network_interface.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }
  disk {
    label = "disk0"
    size  = 20
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = "rt410vws6"
        domain= "gtr.tp"
      }

      network_interface {
        ipv4_address = "10.4.110.246"
        ipv4_netmask = 24
      }
      ipv4_gateway = "10.4.110.254"
      dns_server_list = ["10.4.110.250"]
    }
  }
}

resource "vsphere_virtual_machine" "vm3" {
  name             = "debian-tf3"
  num_cpus         = 2
  resource_pool_id = data.vsphere_resource_pool.pool.id
  memory           = 4096
  guest_id         = "debian10_64Guest"
  datastore_id     = data.vsphere_datastore.datastore.id
  wait_for_guest_net_timeout = 0
  network_interface {
    network_id = data.vsphere_network.network_interface.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }
  disk {
    label = "disk0"
    size  = 20
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = "rt410vws7"
        domain= "gtr.tp"
      }

      network_interface {
        ipv4_address = "10.4.110.247"
        ipv4_netmask = 24
      }
      ipv4_gateway = "10.4.110.254"
      dns_server_list = ["10.4.110.250"]
    }
  }
}