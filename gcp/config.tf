provider "google" {
  project = var.project_id
  region  = var.region
}

data "template_file" "init_script" {
  template = file("./modules/template/init_script.sh")
}