terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "~> 0.100"
    }
  }
}

provider "yandex" {
  token     = var.yc_token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

resource "yandex_compute_instance" "vm" {
  name        = "shitik-fastapi-vm"
  platform_id = "standard-v2"
  zone        = var.zone

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = 20
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.default.id
    nat       = true
  }

  metadata = {
    user-data = file("${path.module}/user_data.sh")
  }
}

resource "yandex_vpc_network" "default" {
  name = "shitik-fastapi-net"
}

resource "yandex_vpc_subnet" "default" {
  name           = "shitik-fastapi-subnet"
  zone           = var.zone
  network_id     = yandex_vpc_network.default.id
  v4_cidr_blocks = ["10.0.1.0/24"]
}

output "external_ip" {
  value = yandex_compute_instance.vm.network_interface.0.nat_ip_address
}
