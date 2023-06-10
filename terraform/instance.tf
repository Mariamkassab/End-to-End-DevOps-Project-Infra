resource "google_compute_instance" "private_vm" {
  name         = "private-bastion"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = google_compute_network.mariam_vpc.id
    subnetwork = google_compute_subnetwork.bastion_subnet.id
  }

  metadata_startup_script = file("automation.tpl")


}