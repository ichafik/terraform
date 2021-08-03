terraform {
  backend "gcs" {
    bucket = "terraform-state-ichafik"
    prefix = "state"
  }
}


provider "google" {
  project = "vital-invention-307210"
  region = "us-east1"
}