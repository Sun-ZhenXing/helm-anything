HELM_RELEASE_NAME ?= cassandra
HELM_APPLICATION_NAME ?= cassandra
HELM_NAMESPACE ?= cassandra
HELM_DIR ?= ./helm
HELM_CHART_VERSION ?=
HELM_VALUES_FILE ?= ./values.yaml
HELM_OCI_REGISTRY ?=
HELM_OCI_NAMESPACE ?=
HELM_OCI_USERNAME ?=
HELM_OCI_PASSWORD ?=

# Operator configuration
OPERATOR_RELEASE_NAME ?= k8ssandra-operator
OPERATOR_NAMESPACE ?= k8ssandra-operator
OPERATOR_CHART_REPO ?= k8ssandra/k8ssandra-operator
OPERATOR_CHART_VERSION ?=
OPERATOR_VALUES_FILE ?= ./values.yaml

# Cluster configuration
CLUSTER_RELEASE_NAME ?= cassandra-cluster
CLUSTER_CHART_REPO ?= k8ssandra/k8ssandra
CLUSTER_VALUES_FILE ?= ./values-cluster.yaml

# Enable CRD waiting
WAIT_FOR_CRD ?= true

include ../_template/base.mk
include ../_template/operator.mk
