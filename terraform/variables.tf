variable "yc_token" {
  description = "Yandex Cloud API key"
  sensitive   = true
}

variable "cloud_id" {
  description = "Yandex Cloud ID"
}

variable "folder_id" {
  description = "Yandex Cloud Folder ID"
}

variable "zone" {
  default = "ru-central1-a"
}

variable "image_id" {
  default = "fd80bm08d6i6e79jgbh5"
}
