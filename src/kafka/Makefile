HELM_RELEASE_NAME ?= kafka
HELM_APPLICATION_NAME ?= kafka
HELM_NAMESPACE ?= kafka
HELM_DIR ?= ./helm
HELM_CHART_VERSION ?= 0.50.0
HELM_VALUES_FILE ?= ./values.yaml
HELM_OCI_REGISTRY ?= docker.io
HELM_OCI_NAMESPACE ?=
HELM_REPO_NAME ?= strimzi
HELM_REPO_URL ?= https://strimzi.io/charts/

# Operator configuration (Strimzi only has operator, cluster is created via CRDs)
OPERATOR_RELEASE_NAME ?= strimzi-kafka-operator
OPERATOR_NAMESPACE ?= strimzi-operator
OPERATOR_CHART_REPO ?= $(HELM_REPO_NAME)/strimzi-kafka-operator
OPERATOR_CHART_VERSION ?= $(HELM_CHART_VERSION)
OPERATOR_VALUES_FILE ?= ./values.yaml

# For Strimzi, we only install the operator
# Kafka clusters are created using Kafka CRDs after operator is installed

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
