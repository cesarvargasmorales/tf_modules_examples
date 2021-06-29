# Variables global
variable "project_id" {}
variable "region" {}

# Variables needed to create instance template and group-manager
variable "image_project_id" {}
variable "family" {}
variable "instance_name" {}
variable "instance_type" {}
variable "disk_size_gb" {}
variable "zone" {}
variable "instance_size" {}
variable "sa_to_gcp" {}
variable "scopes_gcp" {}
variable "nat_ip" {}

# Variable needed to create service account
variable "service_account" {}

# Variable needed to create GKE
variable "k8s_name" {}
variable "k8s_description" {}
variable "network" {}
variable "gcp_region" {}
variable "subnetwork" {}
variable "release_channel" {}
variable "ip_range_pods" {}
variable "ip_range_services" {}
variable "maintenance_start_time" {}
variable "maintenance_end_time" {}
variable "recurrence" {}
variable "k8s_sa" {}
variable "zones" {}

# Variables needed to create node pool
variable "node_count" {}
variable "machine_type" {}

# Variables needed to create CloudSQL
variable "db_version" {}
variable "db_machine_type" {}