terraform {
  backend "gcs" {
    bucket = "rbmh-mit-tg-squad-playground-tf-state"
    prefix = "state"
  }
}


provider "google" {
  project = "rbmh-mit-tg-squad-playground"
  region  = "eu-west"
}