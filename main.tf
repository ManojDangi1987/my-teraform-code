provider "google" {
  project = "cvoproject"
  credentials = "cvoproject.json"
}

resource "google_compute_network" "vpc_network" {
name = "terraform-network"
}
resource "google_compute_instance" "vm_instance" {
name = "terraform-instance"
machine_type = "f1-micro"
zone = "asia-east1-b"
boot_disk {
initialize_params {         
image = "centos-cloud/centos-7"
}
}

network_interface {
network = google_compute_network.vpc_network.name
access_config {
}
}

}

