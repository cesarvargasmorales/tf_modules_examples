resource "google_service_account" "service_account" {
  project      = var.project_id
  account_id   = var.service_account
  display_name = "${var.service_account}-${terraform.workspace}"
}