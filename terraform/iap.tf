resource "google_compute_firewall" "iap_access" {
    name        = "iap-access"
    project     = "iti-final-project-mariam"
    network     = google_compute_network.mariam_vpc.id

    direction = "INGRESS"
    allow {
        protocol = "tcp"
        ports    = ["22" , "80"]  
    }
    source_ranges = [
        "35.235.240.0/20"
    # iap will enforce access control based on the authorized users and their authentication
    ]
}
