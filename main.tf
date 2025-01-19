provider "google" {
  alias			        = "s3nscloud"
  project			    = "s3ns:dgourillon-test"
  region		    	= "u-france-east1"
  universe_domain		= "s3nsapis.fr"
}

resource "google_compute_network" "main" {
  provider                = google.s3nscloud
  name                    = "mynetwork"
  auto_create_subnetworks = false
}