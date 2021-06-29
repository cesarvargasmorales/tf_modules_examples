# Variables needed to create instance template and group-manager
variable "project_id" {}
variable "image_project_id" {}
variable "family" {}
variable "instance_name" {}
variable "instance_type" {}
variable "disk_size_gb" {}
variable "region" {}
variable "zone" {}
variable "instance_size" {}
variable "nat_ip" {}
variable "sa_to_gcp" {}
variable "scopes_gcp" {}
variable "metadata_startup_script" {}