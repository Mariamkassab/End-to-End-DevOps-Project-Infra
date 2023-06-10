resource "google_compute_router" "router" {
  name    = "mariam-router"
  region  = google_compute_subnetwork.bastion_subnet.region
  # the router is associated with the region
  network = google_compute_network.mariam_vpc.id

}