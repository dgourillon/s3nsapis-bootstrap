

provider "google" {
  #alias			        = "s3nscloud"
  project			    = "s3ns:dgourillon-test"
  region		    	= "u-france-east1"
  universe_domain		= "s3nsapis.fr"
}

provider "google-beta" {
  #alias			        = "s3nscloud"
  project			    = "s3ns:dgourillon-test"
  region		    	= "u-france-east1"
  universe_domain		= "s3nsapis.fr"
}