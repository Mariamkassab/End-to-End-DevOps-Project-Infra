resource "google_compute_network" "mariam_vpc" {
  project                 = "iti-final-project-mariam"
  name                    = "mariam-vpc-network"
  auto_create_subnetworks = false
}