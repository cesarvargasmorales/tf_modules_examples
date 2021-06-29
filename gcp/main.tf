module "GKE" {
  source          = "./modules/gke-cluster"
  location        = var.gcp_region
  project_id      = var.project_id
  k8s_name        = var.k8s_name
  k8s_description = var.k8s_description
  network         = var.network
  subnetwork      = var.subnetwork

  release_channel = var.release_channel

  ip_range_pods     = var.ip_range_pods
  ip_range_services = var.ip_range_services
  zones             = var.zones
  k8s_sa            = var.k8s_sa

  maintenance_start_time = var.maintenance_start_time
  maintenance_end_time   = var.maintenance_end_time
  recurrence             = var.recurrence

  # Variables needed to node pool

  node_count   = var.node_count
  machine_type = var.machine_type
}

module "instances-group-gcp" {
  source                  = "./modules/instance-group"
  project_id              = var.project_id
  image_project_id        = var.image_project_id
  family                  = var.family
  instance_name           = var.instance_name
  instance_type           = var.instance_type
  disk_size_gb            = var.disk_size_gb
  region                  = var.region
  zone                    = var.zone
  instance_size           = var.instance_size
  nat_ip                  = var.nat_ip
  sa_to_gcp               = module.service_account.sa_email
  scopes_gcp              = var.scopes_gcp
  metadata_startup_script = data.template_file.init_script.rendered
}

module "service_account" {
  source          = "./modules/sa"
  project_id      = var.project_id
  service_account = var.service_account
}

module "CloudSQL" {
  source          = "./modules/cloud-sql"
  project_id      = var.project_id
  db_version      = var.db_version
  db_machine_type = var.db_machine_type
  region          = var.gcp_region
}