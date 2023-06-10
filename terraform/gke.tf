resource "google_service_account" "default" {
  account_id   = "service-account-id"
  display_name = "Service Account"
}

resource "google_container_cluster" "gke_cluster" {
  name     = "mariam-gke"
  location = "us-central1"

  remove_default_node_pool = true
  initial_node_count       = 1

   private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes = true
  }

  master_authorized_networks_config {
     cidr_blocks {
       cidr_block = "10.0.1.0/24"
       display_name = "bastion"
     }
   }
 }


resource "google_container_node_pool" "primary_nodes" {
  name       = "mariam-node-pool"
  location   = "us-central1"
  cluster    = google_container_cluster.gke_cluster.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-micro"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.default.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}