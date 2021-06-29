resource "google_container_cluster" "primary" {
  provider        = google-beta
  name            = var.k8s_name
  description     = var.k8s_description
  project         = var.project_id
  location        = var.location
  network         = var.network
  subnetwork      = var.subnetwork
  networking_mode = "VPC_NATIVE"

  enable_binary_authorization = false

  # Logging
  logging_service = "logging.googleapis.com/kubernetes"

  # Monitoring
  monitoring_service = "monitoring.googleapis.com/kubernetes"

  release_channel {
    channel = var.release_channel
  }

  # To enable pod security policy. For default default false
  pod_security_policy_config {
    enabled = false
  }

  network_policy {
    enabled = false
  }

  workload_identity_config {
    identity_namespace = "${var.project_id}.svc.id.goog"
  }

  private_cluster_config {
    enable_private_endpoint = true
  }

  addons_config {
    http_load_balancing {
      disabled = true
    }
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = var.ip_range_pods
    services_secondary_range_name = var.ip_range_services
  }

  maintenance_policy {
    recurring_window {
      start_time = var.maintenance_start_time
      end_time   = var.maintenance_end_time
      recurrence = var.recurrence
    }
  }

  timeouts {
    create = "45m"
    update = "45m"
    delete = "45m"
  }

  remove_default_node_pool = true
  initial_node_count       = 1
  node_config {
    service_account = var.k8s_sa
  }

  lifecycle {
    ignore_changes = [
      node_pool,
      node_config,
      initial_node_count
    ]
  }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "node-pool-${terraform.workspace}"
  cluster    = google_container_cluster.primary.id
  node_count = var.node_count

  node_config {
    preemptible  = true
    machine_type = var.machine_type

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = var.k8s_sa
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  management {
    auto_repair  = true
    auto_upgrade = false
  }
}