HELM_RELEASE_NAME ?= prometheus
HELM_APPLICATION_NAME ?= kube-prometheus-stack
HELM_NAMESPACE ?= prometheus
HELM_DIR ?= ./helm
HELM_CHART_VERSION ?=
HELM_VALUES_FILE ?= ./values.yaml
HELM_OCI_REGISTRY ?=
HELM_OCI_NAMESPACE ?=
HELM_OCI_USERNAME ?=
HELM_OCI_PASSWORD ?=
HELM_REPO_NAME ?= prometheus-community
HELM_REPO_URL ?= https://prometheus-community.github.io/helm-charts
HELM_CHART_REPO ?= $(HELM_REPO_NAME)/kube-prometheus-stack
HELM_LANE ?=

include ../_template/base.mk
