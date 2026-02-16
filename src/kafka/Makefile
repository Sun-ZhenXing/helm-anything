HELM_RELEASE_NAME ?= strimzi-kafka-operator
HELM_APPLICATION_NAME ?= strimzi-kafka-operator
HELM_NAMESPACE ?= kafka
HELM_DIR ?= ./helm
HELM_CHART_VERSION ?= 0.50.0
HELM_VALUES_FILE ?= ./values.yaml
HELM_OCI_REGISTRY ?= docker.io
HELM_OCI_NAMESPACE ?=
HELM_REPO_NAME ?= strimzi
HELM_REPO_URL ?= https://strimzi.io/charts/
HELM_CHART_REPO ?= $(HELM_REPO_NAME)/$(HELM_APPLICATION_NAME)
HELM_LANE ?=

include ../_template/base.mk
