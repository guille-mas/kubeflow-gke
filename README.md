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
1. Run `make auth-gcloud`
1. Run `make gcp-build`
1. Run `make kubeflow-build`

## Removal of the GKE cluster

1. Run `make gcp-clean`

## Backlog

- CI/CD with Jenkins worker pod running on GKE
  - See https://www.youtube.com/watch?v=IDoRWieTcMc
  - See https://cloud.google.com/solutions/jenkins-on-kubernetes-engine-tutorial?hl=es
  - See https://github.com/GoogleCloudPlatform/continuous-deployment-on-kubernetes
- [Setup OAuth access to project](https://www.kubeflow.org/docs/gke/deploy/oauth-setup/) (Recommended)
  - A GSuite account is required to setup this
  - Future versions of Kubeflow will require this since other authorization flows have been deprecated in Kubeflow

## Guille's notes

`$ gcloud config configurations list`

```shell
NAME   IS_ACTIVE  ACCOUNT                PROJECT               COMPUTE_DEFAULT_ZONE  COMPUTE_DEFAULT_REGION
core   True       guilledevel@gmail.com  guille-default
ydata  False      guilledevel@gmail.com  exercise-guilledevel
```
