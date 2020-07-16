########
# vpc.tf
########

variable "project_id" {
  description = "project id"
}

variable "region" {
  description = "region"
}

########
# gke.tf
########

variable "gke_num_nodes" {
  default     = 1 # 3 replaced because I ran out of quota
  description = "number of gke nodes"
  type        = number
}

variable "nodes_per_pool" {
  default     = 2
  description = "number of nodes per pool"
  type        = number
}

