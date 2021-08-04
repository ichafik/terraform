resource "google_bigquery_dataset" "views" {
  dataset_id    = "rbmh-mit-tg-squad-playground"
  friendly_name = "rbmh-mit-tg-squad-playground"
  description   = ""
  location      = "EU"
}

resource "google_bigquery_table" "vw_aggregated" {
  dataset_id = google_bigquery_dataset.views.dataset_id
  table_id   = "playground.ichafik_vw_aggregated"

  labels = {
    env = "terraform"
    pic = "jon"
  }

  view {
    query          = "SELECT 2 as numberTwo"
    use_legacy_sql = false
  }
}


