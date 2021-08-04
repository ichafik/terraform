
resource "google_bigquery_table" "vw_aggregated" {
  dataset_id = "playground"
  table_id   = "ichafik_vw_aggregated"


  view {
    query          = "SELECT 2 as numberTwo"
    use_legacy_sql = false
  }
}


