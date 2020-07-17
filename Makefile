include .env

# Set your GCP project ID and the zone where you want to create 
# the Kubeflow deployment:
export ZONE=us-central1
export KF_NAME=${PROJECT_ID}
export BASE_DIR=${PWD}
export KF_DIR=${BASE_DIR}/k8s/kubeflow/${KF_NAME}
export CONFIG_FILE=${KF_DIR}/kfctl_k8s_istio.v1.0.2.yaml

#######################
# Pre Requisites
# @todo: automate gcloud cli setup
# @todo: would be nice to move this logic to a Jenkins pipeline orchestrated with k8s + Helm
#######################

deps-macos:
# Download the kfctl v1.0.2 release from the kfctl releases page.
	mkdir utils
	wget -c https://github.com/kubeflow/kfctl/releases/download/v1.0.2/kfctl_v1.0.2-0-ga476281_darwin.tar.gz -O - | tar -xz -C ./utils/

deps-linux:
# Download the kfctl v1.0.2 release from the kfctl releases page.
	mkdir utils
	curl https://github.com/kubeflow/kfctl/releases/download/v1.0.2/kfctl_v1.0.2-0-ga476281_linux.tar.gz -O - | tar -xz -C ./utils/

#######################
# Helpers
#######################

# A helper command to authorize your gcloud cli, used by kfctl and terraform
auth-gcloud:
# authorize gcloud 
	gcloud auth application-default login

#######################
# GCP / GKE
#######################

gcp-build:
# install any missing terraform plugin
	terraform init
# update the infrastructure if needed
	terraform apply -parallelism=100 \
		-var=project_id=${PROJECT_ID} \
		-var=region=${GCP_REGION} \
        -var=nodes_per_pool=1

gcp-clean:
	terraform destroy -parallelism=100 \
		-var=project_id=${PROJECT_ID} \
		-var=region=${GCP_REGION} \
        -var=nodes_per_pool=1

############
# Kubeflow
######

# Generates Kubeflow infrastructure as code in yaml format
kubeflow-refresh:
# Ensure gcloud has the correct project and compute/zone.
	gcloud config set project ${PROJECT_ID}    
	gcloud config set compute/zone ${ZONE}
# Create the folder to store artifacts generated by kubectl
	mkdir -p ${KF_DIR}
	cd ${KF_DIR}
# Declare every component of the infra in yaml format
	${BASE_DIR}/utils/kfctl build -V -f ${CONFIG_FILE}

kubeflow-build:
	gcloud container clusters get-credentials ${PROJECT_ID}
# deploy the generated infrastructure
	${BASE_DIR}/utils/kfctl apply -V -f ${CONFIG_FILE}

kubeflow-clean:
	${BASE_DIR}/utils/kfctl delete -V -f ${CONFIG_FILE} --delete_storage

