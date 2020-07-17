
output "region" {
  value       = module.gke_kubeflow.region
  description = "region"
}

output "kubernetes_cluster_name" {
  value       = module.gke_kubeflow.kubernetes_cluster_name
  description = "GKE Cluster Name"
}
