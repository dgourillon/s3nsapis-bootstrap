

resource "google_compute_network" "main" {
  provider                = google.s3nscloud
  name                    = "mynetwork"
  auto_create_subnetworks = false
}