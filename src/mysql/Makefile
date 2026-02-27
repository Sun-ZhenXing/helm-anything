HELM_RELEASE_NAME ?= mysql
HELM_APPLICATION_NAME ?= mysql
HELM_NAMESPACE ?= mysql
HELM_DIR ?= ./helm
HELM_CHART_VERSION ?=
HELM_VALUES_FILE ?= ./values.yaml
HELM_OCI_REGISTRY ?=
HELM_OCI_NAMESPACE ?=
HELM_OCI_USERNAME ?=
HELM_OCI_PASSWORD ?=
HELM_REPO_NAME ?= mysql-operator
HELM_REPO_URL ?= https://mysql.github.io/mysql-operator/

# Operator configuration
OPERATOR_RELEASE_NAME ?= mysql-operator
OPERATOR_NAMESPACE ?= mysql-operator
OPERATOR_CHART_REPO ?= $(HELM_REPO_NAME)/mysql-operator
OPERATOR_CHART_VERSION ?=
OPERATOR_VALUES_FILE ?=

# Cluster configuration
CLUSTER_RELEASE_NAME ?= mysql-cluster
CLUSTER_CHART_REPO ?= $(HELM_REPO_NAME)/mysql-innodbcluster
CLUSTER_VALUES_FILE ?= ./values.yaml

# Enable CRD waiting
WAIT_FOR_CRD ?= true

include ../_template/base.mk
include ../_template/operator.mk
