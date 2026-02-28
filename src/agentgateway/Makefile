HELM_RELEASE_NAME ?= agentgateway
HELM_APPLICATION_NAME ?= agentgateway
HELM_NAMESPACE ?= agentgateway-system
HELM_DIR ?= ./helm
HELM_CHART_VERSION ?= v2.2.0
HELM_VALUES_FILE ?= ./values.yaml
HELM_OCI_REGISTRY ?= cr.agentgateway.dev
HELM_OCI_NAMESPACE ?= charts
HELM_OCI_USERNAME ?=
HELM_OCI_PASSWORD ?=
HELM_CHART_REPO ?= oci://$(HELM_OCI_REGISTRY)/$(HELM_OCI_NAMESPACE)/$(HELM_APPLICATION_NAME)

# CRD configuration
CRD_INSTALL_GATEWAY_API = true
CRD_HELM_CHART_REPO = oci://$(HELM_OCI_REGISTRY)/$(HELM_OCI_NAMESPACE)/agentgateway-crds
CRD_HELM_RELEASE_NAME = agentgateway-crds

# Gateway configuration
GATEWAY_CLASS_NAME = agentgateway

include ../_template/base.mk
include ../_template/crd.mk
include ../_template/gateway.mk
