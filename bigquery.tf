resource "google_bigquery_dataset" "views" {
  dataset_id    = "playground"
  friendly_name = "playground"
  description   = ""
  location      = "EU"
}

resource "google_bigquery_table" "vw_aggregated" {
  dataset_id = google_bigquery_dataset.views.dataset_id
  table_id   = "ichafik_vw_aggregated"


  view {
    query          = "SELECT 2 as numberTwo"
    use_legacy_sql = false
  }
}


