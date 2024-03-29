resource "google_bigtable_instance" "production-instance" {
  name                = var.bigtable_instance_name
  project             = var.project_id
  deletion_protection = false

  cluster {
    cluster_id   = var.cluster_name
    storage_type = var.storage_type
    zone         = var.zone
    num_nodes    = var.number_of_cluster
    #kms_key_name = var.kms_key_name
  }
  lifecycle {
    ignore_changes = [labels]
  }
}

resource "google_bigtable_table" "table" {
  count         = var.no_of_tables
  name          = var.table_name[count.index]
  project       = var.project_id
  instance_name = google_bigtable_instance.production-instance.name
}

resource "google_bigtable_app_profile" "app_profile" {
  count                         = var.enable_app_profile ? 1 : 0
  project                       = var.project_id
  instance                      = google_bigtable_instance.production-instance.name
  app_profile_id                = var.app_profile_id
  multi_cluster_routing_use_any = var.multi_cluster_routing_use_any
  ignore_warnings               = var.ignore_warnings
}

