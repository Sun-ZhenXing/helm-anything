HELM_RELEASE_NAME ?= rabbitmq
HELM_APPLICATION_NAME ?= rabbitmq
HELM_NAMESPACE ?= rabbitmq
HELM_DIR ?= ./helm
HELM_CHART_VERSION ?= 0.2.0
HELM_VALUES_FILE ?= ./values.yaml
HELM_OCI_REGISTRY ?= docker.io
HELM_OCI_NAMESPACE ?= cloudpirates
HELM_OCI_USERNAME ?=
HELM_OCI_PASSWORD ?=

# Operator configuration
OPERATOR_RELEASE_NAME ?= rabbitmq-cluster-operator
OPERATOR_NAMESPACE ?= rabbitmq-operator
OPERATOR_CHART_REPO ?= oci://$(HELM_OCI_REGISTRY)/$(HELM_OCI_NAMESPACE)/rabbitmq-cluster-operator
OPERATOR_CHART_VERSION ?= $(HELM_CHART_VERSION)
OPERATOR_VALUES_FILE ?= ./values.yaml

# For RabbitMQ Cluster Operator, we only install the operator
# RabbitMQ clusters are created using RabbitmqCluster CRDs after operator is installed

include ../_template/base.mk
include ../_template/operator.mk

# Override install target to only install operator
.PHONY: install
install: install-operator

# Override uninstall target to only uninstall operator
.PHONY: uninstall
uninstall: uninstall-operator

# Override verify target
.PHONY: verify
verify: verify-operator
