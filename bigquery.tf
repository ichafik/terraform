resource "google_bigquery_dataset" "views" {
  dataset_id    = "vital"
  friendly_name = "vital"
  description   = ""
  location      = "US"

  labels = {
    env = "terraform"
    pic = "jon"
  }
}

resource "google_bigquery_table" "vw_aggregated" {
  dataset_id = google_bigquery_dataset.views.dataset_id
  table_id   = "vw_aggregated"

  labels = {
    env = "terraform"
    pic = "jon"
  }

  view {
    query          = "SELECT * from `vital-invention-307210.pricingReport.gcp_billing_export_v1_01614C_4D742C_708252`"
    use_legacy_sql = false
  }
}