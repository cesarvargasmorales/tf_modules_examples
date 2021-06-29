
resource "random_id" "db_name_suffix" {
  byte_length = 4
}

resource "google_sql_database" "database" {
  name     = var.db_version
  instance = google_sql_database_instance.master.name
  project  = var.project_id
}

resource "google_sql_database_instance" "master" {
  name             = "${var.db_version}-${terraform.workspace}-${random_id.db_name_suffix.hex}"
  project          = var.project_id
  database_version = "POSTGRES_11"
  region           = var.region

  settings {
    tier      = var.db_machine_type
    disk_size = 30

    backup_configuration {
      enabled    = true
      start_time = "00:00"
    }
  }
}
