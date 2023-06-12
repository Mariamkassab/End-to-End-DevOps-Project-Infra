resource "google_container_cluster" "gke_cluster" {
  name     = "mariam-gke"
  location = "us-central1-a"

  remove_default_node_pool = true
  initial_node_count       = 3


  network = google_compute_network.mariam_vpc.id
  subnetwork = google_compute_subnetwork.gke_subnet.id


  private_cluster_config {
   enable_private_endpoint = true
   enable_private_nodes = true
   master_ipv4_cidr_block  = "172.16.0.0/28"

  }

  master_authorized_networks_config {
     cidr_blocks {
       cidr_block = "10.0.1.0/24"
       display_name = "bastion"
     }
     
   }
  ip_allocation_policy {
    cluster_ipv4_cidr_block  = ""
    services_ipv4_cidr_block = ""
  }

 }


resource "google_container_node_pool" "primary_nodes" {
  name       = "mariam-node-pool"
  location   = "us-central1"
  cluster    = google_container_cluster.gke_cluster.id
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    service_account = google_service_account.gke-service-account.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}