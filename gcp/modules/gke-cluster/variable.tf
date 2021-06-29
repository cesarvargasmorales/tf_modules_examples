# Variables needed to create GKE cluster
variable "project_id" {}
variable "k8s_name" {}
variable "k8s_description" {}
variable "location" {}
variable "network" {}
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