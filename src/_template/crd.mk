# CRD (Custom Resource Definition) Installation Template
# This file provides common targets for installing CRDs before deploying Helm charts.
#
# Usage:
#   include ../_template/crd.mk
#
# Required variables:
#   HELM_RELEASE_NAME        - The name of the Helm release
#   HELM_NAMESPACE           - The namespace for the deployment
#   HELM_CHART_VERSION       - The version of the Helm chart
#
# Optional variables:
#   CRD_HELM_CHART_REPO      - The Helm chart repository for CRDs (if using Helm to install CRDs)
#   CRD_HELM_RELEASE_NAME    - The release name for CRD installation (defaults to $(HELM_RELEASE_NAME)-crds)
#   CRD_HELM_NAMESPACE       - The namespace for CRD installation (defaults to $(HELM_NAMESPACE))
#   CRD_KUBECTL_URLS         - Space-separated list of URLs to apply via kubectl
#   CRD_INSTALL_GATEWAY_API  - Set to "true" to install Gateway API CRDs
#   GATEWAY_API_VERSION      - Version of Gateway API to install (defaults to v1.4.0)

CRD_HELM_RELEASE_NAME ?= $(HELM_RELEASE_NAME)-crds
CRD_HELM_NAMESPACE ?= $(HELM_NAMESPACE)
GATEWAY_API_VERSION ?= v1.4.0

# Install CRDs via kubectl apply
.PHONY: install-crds-kubectl
install-crds-kubectl:
ifdef CRD_KUBECTL_URLS
	@echo "Installing CRDs from URLs..."
	@for url in $(CRD_KUBECTL_URLS); do \
		echo "Applying $$url..."; \
		kubectl apply -f $$url; \
	done
else
	@echo "CRD_KUBECTL_URLS not set, skipping kubectl CRD installation."
endif

# Install Gateway API CRDs
.PHONY: install-crds-gateway-api
install-crds-gateway-api:
ifeq ($(CRD_INSTALL_GATEWAY_API),true)
	@echo "Installing Gateway API CRDs (version: $(GATEWAY_API_VERSION))..."
	kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/$(GATEWAY_API_VERSION)/standard-install.yaml
else
	@echo "CRD_INSTALL_GATEWAY_API not set to 'true', skipping Gateway API CRD installation."
endif

# Install CRDs via Helm
.PHONY: install-crds-helm
install-crds-helm:
ifdef CRD_HELM_CHART_REPO
	@echo "Installing CRDs via Helm..."
	helm upgrade -i --create-namespace \
		--namespace $(CRD_HELM_NAMESPACE) \
		$(if $(HELM_CHART_VERSION),--version $(HELM_CHART_VERSION),) \
		$(CRD_HELM_RELEASE_NAME) $(CRD_HELM_CHART_REPO)
else
	@echo "CRD_HELM_CHART_REPO not set, skipping Helm CRD installation."
endif

# Install all CRDs (kubectl + Gateway API + Helm)
.PHONY: install-crds
install-crds: install-crds-kubectl install-crds-gateway-api install-crds-helm
	@echo "All CRDs installed successfully."

# Install CRDs and then the main chart
.PHONY: install-all
install-all: install-crds install

# Verify CRD installation
.PHONY: verify-crds
verify-crds:
ifdef CRD_KUBECTL_URLS
	@echo "Verifying CRDs..."
	@for url in $(CRD_KUBECTL_URLS); do \
		crd_name=$$(basename $$url | sed 's/\.yaml$$//'); \
		echo "Checking CRD: $$crd_name..."; \
	done
endif
ifeq ($(CRD_INSTALL_GATEWAY_API),true)
	@echo "Verifying Gateway API CRDs..."
	kubectl get crd | grep gateway.networking.k8s.io || echo "Gateway API CRDs not found"
endif
