resource "google_service_account" "ansible-service-account" {
  account_id = "ansible-service-account"
  display_name = "ansible-service-account"
  project = "iti-final-project-mariam"
}

resource "google_project_iam_binding" "ansible-service-account-iam" {
  project = "iti-final-project-mariam"
  role    = "roles/container.developer"
  members = [
    "serviceAccount:${google_service_account.ansible-service-account.email}"
  ]
}

resource "google_service_account_key" "ansible-key" {
  service_account_id = google_service_account.ansible-service-account.id
}

resource "local_file" "private_key_file" {
  filename = "/home/mariam/Desktop/iti_project/infra_repo/ansible/ansible_key.json"
  content  = google_service_account_key.ansible-key.private_key
}