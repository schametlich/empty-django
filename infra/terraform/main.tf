terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

# Провайдер - интерпретатор terraform-файлов,
# заточенный под конктретного поставщика
provider "yandex" {
  zone = "ru-central1-a"
}

data "yandex_compute_image" "ubuntu2004" {
  family = "ubuntu-2004-lts"
}

# Ресурс: что-то, что нужно создать
# Начинается с Типа-ресурса и Названия-внутри-файла
# Внутри находятся параметры
resource "yandex_compute_instance" "vm-1" {
  name = "terra"
  allow_stopping_for_update = "true"
  
  resources {
    cores  = 2
    memory = 2
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu2004.id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }
}

resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

output "external_ip_address_vm_1" {
  value = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
}
