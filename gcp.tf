# GKE Terraform module initialization
module "gke_kubeflow" {
    source      = "./gcp"
    region      = var.region
    project_id  = var.project_id
}
