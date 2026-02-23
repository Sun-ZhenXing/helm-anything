HELM_RELEASE_NAME ?= kgateway
HELM_APPLICATION_NAME ?= kgateway
HELM_NAMESPACE ?= kgateway-system
HELM_DIR ?= ./helm
HELM_CHART_VERSION ?=
HELM_VALUES_FILE ?= ./values.yaml
HELM_OCI_REGISTRY ?= cr.kgateway.dev
HELM_OCI_NAMESPACE ?= kgateway-dev/charts
HELM_OCI_USERNAME ?=
HELM_OCI_PASSWORD ?=
HELM_CHART_REPO ?= oci://$(HELM_OCI_REGISTRY)/$(HELM_OCI_NAMESPACE)/$(HELM_APPLICATION_NAME)

include ../_template/base.mk
