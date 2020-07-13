# kubeflow-gke

## Project structure

- gcp/ \
GCP/GKE cluster infrastructure-as-code
- gcp.tf \
High level infrastructure-as-code; Initialization of terraform module.
- golang/ \
Golang app source code
- Makefile \
High level cli interface
- README.md \
You are here

## GNUMake Commands

- setup
  - setup-gke
- provision-gke
  - setup-kubeflow
- start
  - start-kubeflow
- stop
  - stop-kubeflow

## Pre-requisites

- a GCP account
- [a Google billing account associated to the project](https://console.cloud.google.com/billing/projects?folder&organizationId)
- a configured gcloud SDK
- kubectl

## Backlog

- Wire provision-gke-cluster parameters with terraform's module variables for region and gke cluster name
- [Setup OAuth access to project](https://www.kubeflow.org/docs/gke/deploy/oauth-setup/) (Optional)

## Guille's notes

`$ gcloud config configurations list`

```shell
NAME   IS_ACTIVE  ACCOUNT                PROJECT               COMPUTE_DEFAULT_ZONE  COMPUTE_DEFAULT_REGION
core   True       guilledevel@gmail.com  guille-default
ydata  False      guilledevel@gmail.com  exercise-guilledevel
```
