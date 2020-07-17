# kubeflow-gke

## Project structure

- README.md \
You are here
- Makefile \
High level cli interface
- gcp/ \
infrastructure-as-code for GKE cluster and Google VPC
- gcp.tf \
Initialization of terraform module declared in .gcp
- k8s/kubeflow \
Kubeflow k8s files

## Pre-requisites

- A GCP account
- [A GCP Project associated with a billing account](https://console.cloud.google.com/billing/projects?folder&organizationId)
- GCloud SDK
- kubectl

## Step by step deployment of a GKE cluster with Kubeflow and Istio

1. Double check each item at the Pre-requisites section
1. Install kfctl locally with `make deps-macos` or `make deps-linux`
1. Run `make auth-gcloud` and grant gcloud authorization to interact with GCP's k8s API
1. Run `make gcp-build` to deploy a VPC and a GKE cluster
1. You might need to wait a few minutes for the VPC and GKE cluster to be ready
1. Run `make kubeflow-refresh` to refresh your kubeflow infrastructure's code
1. Run `make kubeflow-build` to install kubeflow

- Or cross your fingers and run `make all` ;-)

## Shutdown and remove all the infrastructure

- `make clean`

## Backlog

- CI/CD with Jenkins worker pod running on GKE
  - See https://www.youtube.com/watch?v=IDoRWieTcMc
  - See https://cloud.google.com/solutions/jenkins-on-kubernetes-engine-tutorial?hl=es
  - See https://github.com/GoogleCloudPlatform/continuous-deployment-on-kubernetes
- [Setup OAuth access to project](https://www.kubeflow.org/docs/gke/deploy/oauth-setup/) (Recommended)
  - A GSuite account is required to setup this
  - Future versions of Kubeflow will require this since other authorization flows have been deprecated in Kubeflow
