terraform {
  required_version = ">= 0.12"

  required_providers {
    google = "~> 3.30"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}
