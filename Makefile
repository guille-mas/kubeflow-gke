
auth-gcloud:
# authorize gcloud 
	gcloud auth application-default login

create-gke-cluster:
# install any missing terraform plugin
	terraform init -var-file="./terraform.tfvars"
# update the infrastructure if needed
	terraform apply -parallelism=100 -var-file="./terraform.tfvars"

provision-gke-cluster:
# Wire kubectl to your remote GKE cluster
# @todo: "guille-default-gke" and "us-central1" should be read from same source than terraform input variables 
	gcloud container clusters get-credentials guille-default-gke --region us-central1


setup: create-gke-cluster provision-gke-cluster

clean:
	terraform destroy -parallelism=100
