resource "google_compute_subnetwork" "gke_subnet" {
  name          = "gke-subnet"
  region        = "us-central1"
  network       = google_compute_network.mariam_vpc.id
  ip_cidr_range = "10.0.0.0/24"
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "bastion_subnet" {
  name          = "bastion-subnet"
  region        = "us-central1"
  network       = google_compute_network.mariam_vpc.id
  ip_cidr_range = "10.0.1.0/24"
  private_ip_google_access = true
  #the cidr should be added in the autorithed networks of the cluster
}
