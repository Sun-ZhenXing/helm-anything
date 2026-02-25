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

include ../_template/base.mk

.PHONY: install-crds
install-crds:
	@echo "Installing Gateway API CRDs..."
	kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.4.0/standard-install.yaml
	@echo "Installing agentgateway CRDs..."
	helm upgrade -i --create-namespace \
		--namespace $(HELM_NAMESPACE) \
		--version $(HELM_CHART_VERSION) \
		agentgateway-crds oci://$(HELM_OCI_REGISTRY)/$(HELM_OCI_NAMESPACE)/agentgateway-crds

.PHONY: install-all
install-all: install-crds install

.PHONY: verify
verify:
	@echo "Verifying agentgateway installation..."
	kubectl get pods -n $(HELM_NAMESPACE)
	kubectl get gatewayclass agentgateway
