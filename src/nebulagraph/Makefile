HELM_RELEASE_NAME ?= nebula
HELM_APPLICATION_NAME ?= nebula
HELM_NAMESPACE ?= nebula
HELM_DIR ?= ./helm
HELM_CHART_VERSION ?=
HELM_VALUES_FILE ?= ./values.yaml
HELM_OCI_REGISTRY ?=
HELM_OCI_NAMESPACE ?=
HELM_OCI_USERNAME ?=
HELM_OCI_PASSWORD ?=
HELM_REPO_NAME ?= nebula-operator
HELM_REPO_URL ?= https://vesoft-inc.github.io/nebula-operator/charts

# Operator configuration
OPERATOR_RELEASE_NAME ?= nebula-operator
OPERATOR_NAMESPACE ?= nebula-operator-system
OPERATOR_CHART_REPO ?= $(HELM_REPO_NAME)/nebula-operator
OPERATOR_CHART_VERSION ?=
OPERATOR_VALUES_FILE ?=

# Cluster configuration
CLUSTER_RELEASE_NAME ?= nebula-cluster
CLUSTER_CHART_REPO ?= $(HELM_REPO_NAME)/nebula-cluster
CLUSTER_VALUES_FILE ?= ./values.yaml

# Enable CRD waiting
WAIT_FOR_CRD ?= true

include ../_template/base.mk
include ../_template/operator.mk
