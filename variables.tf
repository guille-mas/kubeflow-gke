########
# vpc.tf
########

variable "project_id" {
  type        = string
  description = "GCP project id"
}

variable "region" {
  type        = string
  description = "To which region would you like to deploy your GKE infrastructure?"
}

variable "nodes_per_pool" {
  type        = number
  description = "Number of nodes per pool"
}
