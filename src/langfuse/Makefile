HELM_RELEASE_NAME ?= langfuse
HELM_APPLICATION_NAME ?= langfuse
HELM_NAMESPACE ?= langfuse
HELM_DIR ?= ./helm
HELM_CHART_VERSION ?= 1.5.19
HELM_VALUES_FILE ?= ./values.yaml
HELM_OCI_REGISTRY ?= docker.io
HELM_OCI_NAMESPACE ?=
HELM_REPO_NAME ?= langfuse
HELM_REPO_URL ?= https://langfuse.github.io/langfuse-k8s
HELM_CHART_REPO ?= $(HELM_REPO_NAME)/$(HELM_APPLICATION_NAME)
HELM_LANE ?=

include ../_template/base.mk
