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

variable "gke_username" {
  default     = ""
  description = "gke username"
}

variable "gke_password" {
  default     = ""
  description = "gke password"
}

variable "gke_num_nodes" {
  default     = 1 # 3 replaced because I ran out of quota
  description = "number of gke nodes"
}
