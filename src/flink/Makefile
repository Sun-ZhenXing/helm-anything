HELM_RELEASE_NAME ?= flink
HELM_APPLICATION_NAME ?= flink
HELM_NAMESPACE ?= flink
HELM_DIR ?= ./helm
HELM_CHART_VERSION ?=
HELM_VALUES_FILE ?= ./values.yaml
HELM_OCI_REGISTRY ?=
HELM_OCI_NAMESPACE ?=
HELM_OCI_USERNAME ?=
HELM_OCI_PASSWORD ?=
HELM_REPO_NAME ?= flink-operator
HELM_REPO_URL ?= https://downloads.apache.org/flink/flink-kubernetes-operator-1.9.0/

# Operator configuration
OPERATOR_RELEASE_NAME ?= flink-operator
OPERATOR_NAMESPACE ?= flink-operator
OPERATOR_CHART_REPO ?= $(HELM_REPO_NAME)/flink-operator
OPERATOR_CHART_VERSION ?=
OPERATOR_VALUES_FILE ?= ./values.yaml

# Cluster configuration (Flink uses FlinkDeployment CR, installed via kubectl or separate chart)
CLUSTER_RELEASE_NAME ?= flink-cluster
CLUSTER_CHART_REPO ?= $(HELM_REPO_NAME)/flink-cluster
CLUSTER_VALUES_FILE ?= ./cluster-values.yaml

# Enable CRD waiting
WAIT_FOR_CRD ?= true

include ../_template/base.mk
include ../_template/operator.mk
