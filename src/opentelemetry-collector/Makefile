HELM_RELEASE_NAME ?= opentelemetry-collector
HELM_APPLICATION_NAME ?= opentelemetry-collector
HELM_NAMESPACE ?= observability
HELM_DIR ?= ./helm
HELM_CHART_VERSION ?= latest
HELM_VALUES_FILE ?= ./values.yaml
HELM_OCI_REGISTRY ?= docker.io
HELM_OCI_NAMESPACE ?=
HELM_REPO_NAME ?= open-telemetry
HELM_REPO_URL ?= https://open-telemetry.github.io/opentelemetry-helm-charts
HELM_CHART_REPO ?= $(HELM_REPO_NAME)/$(HELM_APPLICATION_NAME)

include ../_template/base.mk
