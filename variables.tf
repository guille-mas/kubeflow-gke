########
# vpc.tf
########

variable "project_id" {
  description = "project id"
}

variable "region" {
  description = "region"
}

variable "nodes_per_pool" {
  description = "number of nodes per pool"
}

variable "gke_username" {
  description = "gke username"
}

variable "gke_password" {
  description = "gke password"
}
