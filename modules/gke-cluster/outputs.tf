output "name" {
  description = "GKE Cluster Name"
  value       = lookup(google_container_cluster.primary, "name", var.k8s_name)
}