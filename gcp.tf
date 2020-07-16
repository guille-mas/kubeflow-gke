# GKE Terraform module initialization
module "gke_kubeflow" {
    source          = "./gcp"
    region          = var.region
    project_id      = var.project_id
    gke_username    = var.gke_username
    gke_password    = var.gke_password
    nodes_per_pool  = var.nodes_per_pool
}
