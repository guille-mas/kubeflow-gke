

setup-gke:
# install any missing terraform plugin
	terraform init -var-file="./terraform.tfvars"
# update the infrastructure if needed
	terraform apply -parallelism=100 -var-file="./terraform.tfvars"

setup-kubeflow:
	echo "not implemented"

setup: setup-gke setup-kubeflow
