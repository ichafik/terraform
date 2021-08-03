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

resource "google_bigquery_table" "vw_aggregated_todelete" {
  dataset_id = google_bigquery_dataset.views.dataset_id
  table_id   = "vw_aggregated_todelete"

  labels = {
    env = "terraform"
    pic = "jon"
  }

  view {
    query          = "SELECT 1 as numberOne"
    use_legacy_sql = false
  }
}
resource "google_bigquery_data_transfer_config" "query_config" {

  display_name           = "my-query"
  data_source_id         = "scheduled_query"
  schedule               = "first sunday of quarter 00:00"
  destination_dataset_id = google_bigquery_dataset.views.dataset_id
  params = {
    destination_table_name_template = "my_table"
    write_disposition               = "WRITE_APPEND"
    query                           = "SELECT 1 "
  }
}

