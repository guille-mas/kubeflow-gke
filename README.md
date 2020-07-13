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
  - setup-kubeflow
- start
  - start-kubeflow
- stop
  - stop-kubeflow

## Pre-requisites

- a GCP account
- a configured gcloud SDK
- kubectl

## Guille's notes

`$ gcloud config list`

```shell
gcloud config configurations list
NAME   IS_ACTIVE  ACCOUNT                PROJECT               COMPUTE_DEFAULT_ZONE  COMPUTE_DEFAULT_REGION
core   True       guilledevel@gmail.com  guille-default
ydata  False      guilledevel@gmail.com  exercise-guilledevel
```
