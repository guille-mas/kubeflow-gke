
########
# vpc.tf
########

output "region" {
  value       = var.region
  description = "region"
}

########
# gke.tf
########

output "kubernetes_cluster_name" {
  value       = google_container_cluster.primary.name
  description = "GKE Cluster Name"
}